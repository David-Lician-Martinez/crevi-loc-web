import assert from 'node:assert/strict';
import { readFile } from 'node:fs/promises';
import test from 'node:test';

const html = await readFile(new URL('../index.html', import.meta.url), 'utf8');
const css = await readFile(new URL('../src/styles.css', import.meta.url), 'utf8');

test('uses the correctly accented location subtitle', () => {
  assert.match(html, /Busca una partida y abre la ubicación exacta en Google Maps\./u);
});

test('offers the current Android APK as a download', () => {
  assert.match(
    html,
    /<a[^>]+href="\.\/downloads\/crevi-loc\.apk"[^>]+download[^>]*>\s*Descarga la App\s*<\/a>/u,
  );
});

test('offers the printable web QR as a download', () => {
  assert.match(
    html,
    /<a[^>]+href="\.\/downloads\/crevi-loc-web-qr\.png"[^>]+download[^>]*>\s*Descarga el QR Web\s*<\/a>/u,
  );
});

test('keeps both links side by side until their container is truly narrow', () => {
  assert.match(css, /\.panel\s*\{[^}]*container-type:\s*inline-size/si);
  assert.match(css, /\.download-links\s*\{[^}]*grid-template-columns:\s*repeat\(2,/si);
  assert.match(css, /@container\s*\(max-width:\s*280px\)/u);
});
