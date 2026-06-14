export function normalizeLocationName(value) {
  return value
    .trim()
    .toLowerCase()
    .replace(/ñ/g, 'ny')
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/\s+/g, ' ');
}

export function toPartidaId(displayName) {
  return normalizeLocationName(displayName).replace(/ /g, '_');
}
