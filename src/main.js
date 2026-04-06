const app = document.getElementById('app');
const themeSwitch = document.getElementById('themeSwitch');
const themeLabel = document.getElementById('themeLabel');
const partidaSelect = document.getElementById('partidaSelect');
const numberInput = document.getElementById('numberInput');
const suffixInput = document.getElementById('suffixInput');
const searchButton = document.getElementById('searchButton');
const statusText = document.getElementById('statusText');
const resultCard = document.getElementById('resultCard');
const resultTitle = document.getElementById('resultTitle');
const resultCoords = document.getElementById('resultCoords');
const openMapsButton = document.getElementById('openMapsButton');
const shareButton = document.getElementById('shareButton');

const THEME_KEY = 'crevi-loc-theme-dark';

let dataset = {};
let currentEntry = null;

init().catch((error) => {
  console.error(error);
  statusText.textContent = 'Error cargando los datos';
});

async function init() {
  applyTheme(loadTheme());

  const [datasetRes, partidaListRes] = await Promise.all([
    fetch('./partidas.clean.json'),
    fetch('./partidas.list.txt')
  ]);

  dataset = await datasetRes.json();
  const partidas = (await partidaListRes.text())
    .split(/\r?\n/)
    .map((line) => line.trim())
    .filter(Boolean);

  partidaSelect.innerHTML = partidas
    .map((partida) => `<option value="${escapeHtml(partida)}">${escapeHtml(partida)}</option>`)
    .join('');

  themeSwitch.addEventListener('change', () => {
    applyTheme(themeSwitch.checked);
    localStorage.setItem(THEME_KEY, String(themeSwitch.checked));
  });

  searchButton.addEventListener('click', runSearch);
  openMapsButton.addEventListener('click', () => {
    if (!currentEntry) return;
    window.location.href = buildMapsUrl(currentEntry);
  });
  shareButton.addEventListener('click', shareCurrent);
}

function runSearch() {
  const partidaDisplay = partidaSelect.value.trim();
  const partidaId = normalizeText(partidaDisplay).replace(/ /g, '_');
  const entries = dataset[partidaId] || [];

  const number = Number.parseInt(numberInput.value.trim(), 10);
  if (!partidaDisplay || Number.isNaN(number)) {
    statusText.textContent = 'Introduce una partida válida y un número';
    resultCard.classList.add('hidden');
    return;
  }

  const suffix = (suffixInput.value.trim().toUpperCase() || 'X');
  const sameNumber = entries
    .filter((entry) => Number.parseInt(entry.number, 10) === number)
    .sort((a, b) => a.suffix.localeCompare(b.suffix));

  const exact = sameNumber.find((entry) => entry.suffix.toUpperCase() === suffix);
  const entry = exact || sameNumber[0];

  if (!entry) {
    statusText.textContent = 'No se encontró la vivienda';
    resultCard.classList.add('hidden');
    currentEntry = null;
    return;
  }

  currentEntry = entry;
  statusText.textContent = exact || suffix === 'X' ? '' : 'No existe esa letra; se muestra la variante base';
  const displayNumber = String(Number.parseInt(entry.number, 10));
  const displaySuffix = entry.suffix === 'X' ? '' : entry.suffix;
  resultTitle.textContent = `PTDA. ${partidaDisplay} ${displayNumber}${displaySuffix}`;
  resultCoords.textContent = `${entry.lat}, ${entry.lng}`;
  resultCard.classList.remove('hidden');
}

function buildMapsUrl(entry) {
  return `https://www.google.com/maps/search/?api=1&query=${entry.lat},${entry.lng}`;
}

async function shareCurrent() {
  if (!currentEntry) return;
  const partidaDisplay = partidaSelect.value.trim();
  const displayNumber = String(Number.parseInt(currentEntry.number, 10));
  const suffix = currentEntry.suffix === 'X' ? '' : currentEntry.suffix;
  const text = `PTDA. ${partidaDisplay} ${displayNumber}${suffix}\n${buildMapsUrl(currentEntry)}`;

  if (navigator.share) {
    await navigator.share({ text });
  } else {
    await navigator.clipboard.writeText(text);
    statusText.textContent = 'Ubicación copiada al portapapeles';
  }
}

function applyTheme(dark) {
  app.classList.toggle('theme-dark', dark);
  app.classList.toggle('theme-light', !dark);
  themeSwitch.checked = dark;
  themeLabel.textContent = dark ? 'Tema oscuro' : 'Tema claro';
}

function loadTheme() {
  return localStorage.getItem(THEME_KEY) === 'true';
}

function normalizeText(value) {
  return value
    .trim()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .toLowerCase()
    .replace(/ñ/g, 'ny')
    .replace(/\s+/g, ' ');
}

function escapeHtml(value) {
  return value
    .replaceAll('&', '&amp;')
    .replaceAll('<', '&lt;')
    .replaceAll('>', '&gt;')
    .replaceAll('"', '&quot;');
}
