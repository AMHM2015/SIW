<?php
declare(strict_types=1);
session_start();

header('Content-Type: application/json; charset=utf-8');
header('X-Content-Type-Options: nosniff');

$root = __DIR__;
$dataFile = $root . DIRECTORY_SEPARATOR . 'cms-data.json';
$configFile = $root . DIRECTORY_SEPARATOR . 'cms-config.php';
$method = $_SERVER['REQUEST_METHOD'] ?? 'GET';
$action = $_GET['action'] ?? '';

$readJson = static function (): array {
    $body = file_get_contents('php://input');
    if (!$body) return [];
    $value = json_decode($body, true);
    return is_array($value) ? $value : [];
};

$writeRuntimeData = static function (array $data) use ($root): void {
    $json = json_encode($data, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    $script = "window.SIW_CMS_DATA = " . ($json ?: '{}') . ";\n";
    @file_put_contents($root . DIRECTORY_SEPARATOR . 'cms-runtime-data.js', $script, LOCK_EX);
};

if ($action === 'public') {
    $data = json_decode((string) @file_get_contents($dataFile), true);
    echo json_encode(is_array($data) ? $data : [], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    exit;
}

$configured = is_file($configFile);

if ($action === 'status') {
    echo json_encode(['configured' => $configured, 'authenticated' => !empty($_SESSION['siw_cms_admin'])]);
    exit;
}

if ($action === 'setup') {
    if ($configured || $method !== 'POST') {
        http_response_code(403);
        echo json_encode(['error' => 'Setup is not available']);
        exit;
    }
    $input = $readJson();
    $password = trim((string) ($input['password'] ?? ''));
    if (strlen($password) < 8) {
        http_response_code(400);
        echo json_encode(['error' => 'Password must contain at least 8 characters']);
        exit;
    }
    $hash = password_hash($password, PASSWORD_DEFAULT);
    $config = "<?php\nreturn ['password_hash' => " . var_export($hash, true) . "];\n";
    if (!@file_put_contents($configFile, $config, LOCK_EX)) {
        http_response_code(500);
        echo json_encode(['error' => 'Unable to create CMS configuration']);
        exit;
    }
    $_SESSION['siw_cms_admin'] = true;
    echo json_encode(['ok' => true]);
    exit;
}

if ($action === 'login') {
    if (!$configured || $method !== 'POST') {
        http_response_code(403);
        echo json_encode(['error' => 'CMS setup or login is unavailable']);
        exit;
    }
    $config = require $configFile;
    $input = $readJson();
    $password = (string) ($input['password'] ?? '');
    if (!password_verify($password, (string) ($config['password_hash'] ?? ''))) {
        http_response_code(401);
        echo json_encode(['error' => 'Invalid password']);
        exit;
    }
    session_regenerate_id(true);
    $_SESSION['siw_cms_admin'] = true;
    echo json_encode(['ok' => true]);
    exit;
}

if ($action === 'logout') {
    $_SESSION = [];
    if (ini_get('session.use_cookies')) {
        $params = session_get_cookie_params();
        setcookie(session_name(), '', time() - 42000, $params['path'], $params['domain'], $params['secure'], $params['httponly']);
    }
    session_destroy();
    echo json_encode(['ok' => true]);
    exit;
}

if (empty($_SESSION['siw_cms_admin'])) {
    http_response_code(401);
    echo json_encode(['error' => 'Authentication required']);
    exit;
}

if ($action === 'media-list' && $method === 'GET') {
    $uploadDir = $root . DIRECTORY_SEPARATOR . 'cms-uploads';
    $files = [];
    if (is_dir($uploadDir)) {
        foreach (glob($uploadDir . DIRECTORY_SEPARATOR . '*') ?: [] as $path) {
            if (!is_file($path)) continue;
            $name = basename($path);
            $files[] = [
                'name' => $name,
                'url' => 'cms-uploads/' . rawurlencode($name),
                'size' => filesize($path),
                'modified' => filemtime($path),
            ];
        }
        usort($files, static function ($a, $b) {
            return $b['modified'] <=> $a['modified'];
        });
    }
    echo json_encode(['files' => $files], JSON_UNESCAPED_SLASHES);
    exit;
}

if ($action === 'media-upload' && $method === 'POST') {
    if (!isset($_FILES['file']) || $_FILES['file']['error'] !== UPLOAD_ERR_OK) {
        http_response_code(400);
        echo json_encode(['error' => 'Upload failed']);
        exit;
    }
    $upload = $_FILES['file'];
    if (($upload['size'] ?? 0) > 100 * 1024 * 1024) {
        http_response_code(413);
        echo json_encode(['error' => 'File exceeds the 100 MB limit']);
        exit;
    }
    $finfo = new finfo(FILEINFO_MIME_TYPE);
    $mime = $finfo->file($upload['tmp_name']);
    $mimeMap = [
        'image/jpeg' => 'jpg',
        'image/png' => 'png',
        'image/gif' => 'gif',
        'image/webp' => 'webp',
        'image/avif' => 'avif',
        'video/mp4' => 'mp4',
        'video/webm' => 'webm',
        'video/quicktime' => 'mov',
    ];
    if (!isset($mimeMap[$mime])) {
        http_response_code(415);
        echo json_encode(['error' => 'Only images and MP4, WebM, or MOV videos are allowed']);
        exit;
    }
    $uploadDir = $root . DIRECTORY_SEPARATOR . 'cms-uploads';
    if (!is_dir($uploadDir) && !@mkdir($uploadDir, 0755, true)) {
        http_response_code(500);
        echo json_encode(['error' => 'Unable to create the uploads folder']);
        exit;
    }
    $name = date('Ymd-His') . '-' . bin2hex(random_bytes(5)) . '.' . $mimeMap[$mime];
    $destination = $uploadDir . DIRECTORY_SEPARATOR . $name;
    if (!@move_uploaded_file($upload['tmp_name'], $destination)) {
        http_response_code(500);
        echo json_encode(['error' => 'Unable to save the uploaded file']);
        exit;
    }
    echo json_encode([
        'ok' => true,
        'file' => [
            'name' => $name,
            'url' => 'cms-uploads/' . rawurlencode($name),
            'size' => filesize($destination),
            'modified' => filemtime($destination),
        ],
    ], JSON_UNESCAPED_SLASHES);
    exit;
}

if ($action === 'media-delete' && $method === 'POST') {
    $input = $readJson();
    $name = basename((string) ($input['name'] ?? ''));
    if ($name === '' || $name === '.' || $name === '..') {
        http_response_code(400);
        echo json_encode(['error' => 'Invalid file name']);
        exit;
    }
    $path = $root . DIRECTORY_SEPARATOR . 'cms-uploads' . DIRECTORY_SEPARATOR . $name;
    if (is_file($path) && !@unlink($path)) {
        http_response_code(500);
        echo json_encode(['error' => 'Unable to delete the file']);
        exit;
    }
    echo json_encode(['ok' => true]);
    exit;
}

if ($action === 'save-page' && $method === 'POST') {
    $input = $readJson();
    $page = trim((string) ($input['page'] ?? ''));
    $elements = $input['elements'] ?? null;
    if ($page === '' || !is_array($elements)) {
        http_response_code(400);
        echo json_encode(['error' => 'Invalid page data']);
        exit;
    }
    $data = json_decode((string) @file_get_contents($dataFile), true);
    if (!is_array($data)) $data = [];
    $data[$page] = $elements;
    $json = json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    if (!@file_put_contents($dataFile, (string) $json, LOCK_EX)) {
        http_response_code(500);
        echo json_encode(['error' => 'Unable to save CMS data']);
        exit;
    }
    $writeRuntimeData($data);
    echo json_encode(['ok' => true]);
    exit;
}

if ($action === 'save-seo' && $method === 'POST') {
    $input = $readJson();
    $page = trim((string) ($input['page'] ?? ''));
    if ($page === '') {
        http_response_code(400);
        echo json_encode(['error' => 'Invalid page']);
        exit;
    }
    $data = json_decode((string) @file_get_contents($dataFile), true);
    if (!is_array($data)) $data = [];
    if (!isset($data[$page]) || !is_array($data[$page])) $data[$page] = [];
    $data[$page]['__seo'] = [
        'title' => (string) ($input['title'] ?? ''),
        'description' => (string) ($input['description'] ?? ''),
    ];
    $json = json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    if (!@file_put_contents($dataFile, $json, LOCK_EX)) {
        http_response_code(500);
        echo json_encode(['error' => 'Unable to save SEO data']);
        exit;
    }
    $writeRuntimeData($data);
    echo json_encode(['ok' => true]);
    exit;
}

if ($action === 'reset-page' && $method === 'POST') {
    $input = $readJson();
    $page = trim((string) ($input['page'] ?? ''));
    $data = json_decode((string) @file_get_contents($dataFile), true);
    if (!is_array($data)) $data = [];
    unset($data[$page]);
    $json = json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    if (!@file_put_contents($dataFile, $json, LOCK_EX)) {
        http_response_code(500);
        echo json_encode(['error' => 'Unable to reset page']);
        exit;
    }
    $writeRuntimeData($data);
    echo json_encode(['ok' => true]);
    exit;
}

http_response_code(404);
echo json_encode(['error' => 'Unknown action']);
