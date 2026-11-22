import assert from 'node:assert/strict';
import { spawn } from 'node:child_process';
import { mkdtemp, mkdir, copyFile, readFile, writeFile, rm } from 'node:fs/promises';
import { createServer } from 'node:net';
import { tmpdir } from 'node:os';
import { dirname, join, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';
import test from 'node:test';
import vm from 'node:vm';

const source = resolve(dirname(fileURLToPath(import.meta.url)), '..', 'cms-api.php');

test('CMS preview reloads fresh HTML while preserving the page URL', async () => {
    const editor = await readFile(resolve(dirname(source), 'siw-cms.php'), 'utf8');
    const helper = editor.match(/function loadPreview\(src\)\{[\s\S]*?\n\}/);
    assert.ok(helper, 'preview loader exists');
    const preview = { src: '' };
    let now = 100;
    const context = {
        URL,
        Date: { now: () => now++ },
        window: { location: { href: 'https://example.test/website/siw-cms.php' } },
        $: () => preview,
    };
    vm.runInNewContext(helper[0], context);
    context.loadPreview('about/about.html?other=1#team');
    const first = new URL(preview.src);
    assert.equal(first.pathname, '/website/about/about.html');
    assert.equal(first.searchParams.get('other'), '1');
    assert.equal(first.hash, '#team');
    context.loadPreview(preview.src);
    const second = new URL(preview.src);
    assert.notEqual(first.searchParams.get('_siw_preview'), second.searchParams.get('_siw_preview'));
    assert.equal(second.searchParams.get('other'), '1');
    assert.equal(second.hash, '#team');
});

test('CMS publishes safely from its configured data directory', async t => {
    const root = await mkdtemp(join(tmpdir(), 'siw-cms-test-'));
    const dataDir = join(root, 'data');
    const dataFile = join(dataDir, 'cms-data.json');
    await mkdir(dataDir);
    await copyFile(source, join(root, 'cms-api.php'));
    await writeFile(dataFile, JSON.stringify({ other: { heading: { text: 'Keep' } } }));

    const socket = createServer();
    await new Promise((resolveListen, reject) => {
        socket.once('error', reject);
        socket.listen(0, '127.0.0.1', resolveListen);
    });

    await t.test('public pages apply current API data instead of a stale static snapshot', async () => {
        const script = await readFile(resolve(dirname(source), 'cms-runtime.js'), 'utf8');
        const heading = { textContent: '' };
        const events = [];
        let requested;
        const context = {
            URL,
            Event,
            window: {
                location: { pathname: '/website/about/about.html', protocol: 'https:' },
                SIW_CMS_DATA: { about: { h1: { text: 'Stale' } } },
            },
            document: {
                currentScript: { src: 'https://example.test/website/cms-runtime.js' },
                querySelector: selector => selector === 'h1' ? heading : null,
                dispatchEvent: event => events.push(event.type),
            },
            fetch: async url => {
                requested = url.href;
                return { ok: true, json: async () => ({ about: { h1: { text: 'Published' } } }) };
            },
            console,
        };
        vm.runInNewContext(script, context);
        await new Promise(resolveImmediate => setImmediate(resolveImmediate));
        assert.equal(requested, 'https://example.test/website/cms-api.php?action=public');
        assert.equal(heading.textContent, 'Published');
        assert.deepEqual(events, ['siw-cms-content-ready']);
    });
    const port = socket.address().port;
    await new Promise(resolveClose => socket.close(resolveClose));
    const server = spawn('php', ['-S', `127.0.0.1:${port}`, '-t', root], {
        env: { ...process.env, SIW_CMS_DATA_DIR: dataDir }, stdio: 'ignore',
    });
    t.after(async () => {
        if (server.exitCode === null) {
            server.kill();
            await new Promise(resolveExit => server.once('exit', resolveExit));
        }
        await rm(root, { recursive: true, force: true });
    });

    const base = `http://127.0.0.1:${port}/cms-api.php?action=`;
    let cookie = '';
    async function request(action, body) {
        const response = await fetch(base + action, {
            method: body === undefined ? 'GET' : 'POST',
            headers: { 'Content-Type': 'application/json', Cookie: cookie },
            body: body === undefined ? undefined : JSON.stringify(body),
        });
        const setCookie = response.headers.get('set-cookie');
        if (setCookie) cookie = setCookie.split(';')[0];
        return { status: response.status, body: await response.json() };
    }

    let ready = false;
    for (let attempt = 0; attempt < 50; attempt++) {
        try {
            await request('status');
            ready = true;
            break;
        } catch {
            if (server.exitCode !== null) break;
            await new Promise(resolveWait => setTimeout(resolveWait, 100));
        }
    }
    assert.ok(ready, 'PHP server started');
    assert.equal((await request('setup', { password: 'test-password' })).status, 200);

    await t.test('saves page and SEO while preserving other pages', async () => {
        const result = await request('save-page', {
            page: 'home', elements: { h1: { text: 'Published' } },
            seo: { title: 'Title', description: 'Description' },
        });
        assert.equal(result.status, 200);
        const published = await request('public');
        assert.equal(published.status, 200);
        assert.equal(published.body.other.heading.text, 'Keep');
        assert.equal(published.body.home.h1.text, 'Published');
        assert.deepEqual(published.body.home.__seo, { title: 'Title', description: 'Description' });
        assert.deepEqual(JSON.parse(await readFile(dataFile, 'utf8')), published.body);
    });

    await t.test('legacy SEO and reset actions use the same store', async () => {
        assert.equal((await request('save-seo', { page: 'other', title: 'New', description: '' })).status, 200);
        assert.equal((await request('public')).body.other.__seo.title, 'New');
        assert.equal((await request('reset-page', { page: 'other' })).status, 200);
        assert.equal('other' in (await request('public')).body, false);
    });

    await t.test('invalid data is reported without overwriting it', async () => {
        await writeFile(dataFile, '{bad json');
        assert.equal((await request('public')).status, 500);
        assert.equal((await request('save-page', { page: 'home', elements: {} })).status, 500);
        assert.equal(await readFile(dataFile, 'utf8'), '{bad json');
    });

    await t.test('missing configured data is not replaced', async () => {
        await rm(dataFile);
        assert.equal((await request('public')).status, 500);
        assert.equal((await request('save-page', { page: 'home', elements: {} })).status, 500);
        await assert.rejects(readFile(dataFile));
    });
});
