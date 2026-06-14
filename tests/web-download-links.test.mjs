import assert from 'node:assert/strict';
import { readFile } from 'node:fs/promises';
import test from 'node:test';

const html = await readFile(new URL('../index.html', import.meta.url), 'utf8');

test('offers the current Android APK as a download', () => {
  assert.match(
    html,
    /<a[^>]+href="\.\/downloads\/crevi-loc\.apk"[^>]+download[^>]*>\s*Descárgate la aplicación\s*<\/a>/u,
  );
});

test('offers the printable web QR as a download', () => {
  assert.match(
    html,
    /<a[^>]+href="\.\/downloads\/crevi-loc-web-qr\.png"[^>]+download[^>]*>\s*Descarga el QR de la web\s*<\/a>/u,
  );
});
