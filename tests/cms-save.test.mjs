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

test('CMS editor inline JavaScript parses', async () => {
    const editor = await readFile(resolve(dirname(source), 'siw-cms.php'), 'utf8');
    const script = editor.match(/<script>([\s\S]*?)<\/script>/);
    assert.ok(script, 'editor script exists');
    assert.doesNotThrow(() => new vm.Script(script[1]));
});

test('CMS editor reports malformed server responses instead of claiming success', async () => {
    const editor = await readFile(resolve(dirname(source), 'siw-cms.php'), 'utf8');
    const helper = editor.match(/async function api\(action,options=\{\}\)\{[\s\S]*?\n\}/);
    assert.ok(helper, 'API helper exists');
    const context = {
        fetch: async () => ({ ok: true, json: async () => { throw new SyntaxError('invalid JSON'); } }),
    };
    vm.runInNewContext(helper[0], context);
    await assert.rejects(context.api('save-page'), /Invalid response from CMS server/);
    context.fetch = async () => ({ ok: false, json: async () => ({ error: 'Unable to save CMS data' }) });
    await assert.rejects(context.api('save-page'), /Unable to save CMS data/);
    context.fetch = async () => ({ ok: true, json: async () => ({ ok: true }) });
    assert.equal((await context.api('save-page')).ok, true);
});

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

test('collections preserve originals for incomplete data and replace them for complete data', async t => {
    const script = await readFile(resolve(dirname(source), 'cms-runtime.js'), 'utf8');

    async function render(items) {
        const cards = [];
        const warnings = [];
        const container = { appendChild: card => cards.push(card) };
        function card(title) {
            const heading = { textContent: title };
            const paragraph = { textContent: '' };
            return {
                heading, paragraph, parentElement: container, outerHTML: '<article class="catalog-card"></article>',
                matches: selector => selector === '.catalog-card',
                querySelector: selector => {
                    if (selector === 'h1,h2,h3,h4') return heading;
                    if (selector === '.team-card-position,p,.role-title') return paragraph;
                    return null;
                },
                remove() { const index = cards.indexOf(this); if (index >= 0) cards.splice(index, 1); },
            };
        }
        cards.push(card('Original one'), card('Original two'));
        const document = {
            currentScript: { src: 'https://example.test/cms-runtime.js' },
            querySelector: selector => selector === '.catalog-card' ? cards[0] : selector === '.catalog-grid' ? container : null,
            querySelectorAll: selector => selector === '.catalog-card' ? [...cards] : [],
            createElement: () => ({
                set innerHTML(value) { this.firstElementChild = value === 'invalid' ? null : card('Template'); },
            }),
            dispatchEvent: () => {},
        };
        const context = {
            URL, Event, document,
            window: { location: { pathname: '/products.html', protocol: 'https:' } },
            fetch: async () => ({ ok: true, json: async () => ({
                products: { __collection: { config: 'products', item: '.catalog-card', container: '.catalog-grid', items } },
            }) }),
            console: { warn: message => warnings.push(message), error: () => {} },
        };
        vm.runInNewContext(script, context);
        return { cards, warnings, window: context.window, ready: context.window.SIW_CMS_READY };
    }

    await t.test('incomplete saved item is added without removing original items', async () => {
        const result = await render([{ title: 'Saved item', text: 'Saved text', template: '' }]);
        await result.ready;
        assert.deepEqual(result.cards.map(item => item.heading.textContent), ['Original one', 'Original two', 'Saved item']);
        assert.equal(result.cards[2].paragraph.textContent, 'Saved text');
        assert.equal(result.warnings.length, 1);
    });

    await t.test('complete collections can replace or intentionally remove items', async () => {
        const result = await render([{ title: 'Replacement', template: '<article></article>' }]);
        await result.ready;
        assert.deepEqual(result.cards.map(item => item.heading.textContent), ['Replacement']);
        const empty = await render([]);
        await empty.ready;
        assert.equal(empty.cards.length, 0);
        assert.ok(empty.window.SIW_CMS_COLLECTION_TEMPLATE.html.includes('catalog-card'));
    });

    await t.test('invalid templates do not remove original items', async () => {
        const result = await render([{ title: 'Broken', template: 'invalid' }]);
        await assert.rejects(result.ready, /Invalid CMS collection template/);
        assert.deepEqual(result.cards.map(item => item.heading.textContent), ['Original one', 'Original two']);
    });
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
