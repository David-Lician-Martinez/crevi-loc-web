import assert from 'node:assert/strict';
import { readFile } from 'node:fs/promises';
import test from 'node:test';

const html = await readFile(new URL('../index.html', import.meta.url), 'utf8');
const css = await readFile(new URL('../src/styles.css', import.meta.url), 'utf8');
const js = await readFile(new URL('../src/main.js', import.meta.url), 'utf8');

test('uses the correctly accented location subtitle', () => {
  assert.match(html, /Busca una partida y abre la ubicación exacta en Google Maps\./u);
});

test('offers the current Android APK as a download', () => {
  assert.match(
    html,
    /<a[^>]+href="\.\/downloads\/crevi-loc\.apk"[^>]+download[^>]*>\s*Descarga la App\s*<\/a>/u,
  );
});

test('shows the web QR in a dismissible dialog before downloading it', () => {
  assert.match(html, /id="showQrButton"[^>]*>\s*Mostrar QR Web\s*<\/button>/u);
  assert.match(html, /<dialog[^>]+id="qrDialog"/u);
  assert.match(html, /id="qrDialogBack"[^>]*>\s*Atrás\s*<\/button>/u);
  assert.match(html, /href="\.\/downloads\/crevi-loc-web-qr\.png"[^>]+download[^>]*>\s*Descargar QR\s*<\/a>/u);
  assert.match(js, /showQrButton\.addEventListener\('click',[\s\S]*qrDialog\.showModal\(\)/u);
  assert.match(js, /event\.target !== qrDialog/u);
  assert.match(js, /getBoundingClientRect\(\)/u);
  assert.match(css, /\.qr-dialog::backdrop/u);
});

test('never starts an APK download when merely loading the web', () => {
  assert.doesNotMatch(js, /crevi-loc\.apk/u);
  assert.doesNotMatch(html, /autofocus[^>]+Descarga la App/u);
});

test('keeps both links side by side until their container is truly narrow', () => {
  assert.match(css, /\.panel\s*\{[^}]*container-type:\s*inline-size/si);
  assert.match(css, /\.download-links\s*\{[^}]*grid-template-columns:\s*repeat\(2,/si);
  assert.match(css, /@container\s*\(max-width:\s*280px\)/u);
});
