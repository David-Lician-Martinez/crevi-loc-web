# Reconstrucción de la app Telepizza / Partidas Crevillente

## Qué se ha extraído del APK original

- APK analizado: `base.apk`
- Package detectado en strings: `com.komeet.godemarcacion.crevillente`
- Nombre visible detectado: `Go! Demarcación / Partidas Crevillente`
- Flujo funcional inferido:
  1. El usuario introduce una `partida`
  2. Introduce un `número`
  3. Opcionalmente una `letra/sufijo`
  4. La app busca una clave tipo `0001X`, `0026A`, etc.
  5. Si encuentra coordenadas, abre Google Maps con esa ubicación

## Hallazgos técnicos

Los datos principales NO están en un servidor remoto: están embebidos en `res/raw/` dentro del APK.

Cada fichero de `res/raw/<partida>` contiene líneas como:

```text
0001X:38.244901, -0.814985
0026A:38.242951, -0.816662
```

Eso equivale a:
- `0001` -> número
- `X` -> sufijo por defecto / sin letra explícita
- `A`, `B`, etc. -> variantes con letra
- valor -> latitud, longitud

## Dataset extraído

- Partidas detectadas: 46
- Entradas totales: 3200
- Entradas válidas con coordenadas: 3095
- Entradas inválidas/placeholders: 105

Ficheros generados:
- `partidas.clean.json` -> dataset estructurado por partida
- `partidas.flat.csv` -> exportación tabular
- `summary.json` -> resumen por partida

## Recomendación para la app nueva

### Stack recomendado

Para máxima durabilidad en Android moderno:
- **Kotlin + Jetpack Compose**
- minSdk razonable (por ejemplo 26 o 28)
- targetSdk siempre al último estable
- sin dependencias raras
- base de datos local en JSON incluido en assets, o Room si luego quieres edición/búsqueda avanzada

### Arquitectura sugerida

- `assets/partidas.clean.json`
- `Repository` para cargar datos
- `SearchUseCase` para normalizar entrada del usuario
- `MainScreen` con:
  - selector/autocomplete de partida
  - campo número
  - campo letra opcional
  - botón “Abrir en Maps”
- Intent Android usando URL moderna:
  - `https://www.google.com/maps/search/?api=1&query=<lat>,<lng>`
- fallback a geo URI:
  - `geo:0,0?q=<lat>,<lng>`

### Lógica de búsqueda recomendada

Dado:
- partida = `san_antonio_de_la_florida`
- número = `26`
- letra = `A`

Construir clave normalizada:
- número -> pad a 4 dígitos (`0026`)
- si hay letra -> `0026A`
- si no hay letra -> probar `0026X`
- si no existe, se puede ofrecer búsqueda cercana:
  - mismo número sin letra
  - letras alternativas
  - números próximos ±1 / ±2

## Compatibilidad futura

Para que la nueva app sea “compatible para siempre” en términos prácticos:

- mantener la app como visor de datos local + apertura en Google Maps
- evitar APIs Android antiguas o privadas
- usar URLs estándar de Maps
- desacoplar completamente los datos del binario de la app:
  - dataset en JSON versionado
  - posibilidad futura de actualizar datos sin reescribir la lógica

## Próximos pasos

1. reconstruir la lógica exacta restante del APK (UI y matching fino)
2. generar un proyecto nuevo Android moderno
3. importar el dataset limpio
4. implementar búsqueda + apertura en Maps
5. probar con varios casos reales
6. compilar APK nueva
