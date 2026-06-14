import assert from 'node:assert/strict';
import test from 'node:test';

import { toPartidaId } from '../src/locationKeys.js';

test('maps visible names with ñ to the stable ASCII dataset keys', () => {
  assert.equal(toPartidaId('CAÑADA JUANA'), 'canyada_juana');
  assert.equal(toPartidaId('PEÑA SENDRA'), 'penya_sendra');
});

test('keeps existing ASCII dataset keys stable', () => {
  assert.equal(toPartidaId('canyada_juana'), 'canyada_juana');
  assert.equal(toPartidaId('penya_sendra'), 'penya_sendra');
});
