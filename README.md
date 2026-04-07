# Crevi Loc Web

Aplicacion web estatica para buscar partidas y abrir la ubicacion exacta en Google Maps. Esta preparada para desplegarse directamente en Cloudflare Pages sin backend.

## Caracteristicas

- Busqueda por partida, numero y letra opcional
- Modo claro y oscuro con preferencia guardada en el navegador
- Resultado alternativo con direccion cercana cuando no hay coincidencia exacta
- Boton de compartir y apertura directa en Google Maps
- Endpoint estatico de actualizaciones para la APK en `update.json`

## Stack

- Vite
- JavaScript vanilla
- CSS plano
- Cloudflare Pages

## Estructura

```text
.
|-- public/
|   |-- downloads/         # Aqui podras anadir la APK
|   |-- partidas.clean.json
|   |-- partidas.list.txt
|   |-- update.json
|   `-- _redirects
|-- src/
|   |-- main.js
|   `-- styles.css
|-- index.html
|-- package.json
|-- vite.config.js
`-- wrangler.toml
```

## Desarrollo local

```bash
npm install
npm run dev
```

## Build

```bash
npm run build
```

La salida se genera en `dist/`.

## Despliegue en Cloudflare Pages

Configura el proyecto con estos valores:

- Framework preset: `Vite`
- Production branch: `main`
- Build command: `npm run build`
- Build output directory: `dist`
- Node version: `20`

No hacen falta variables de entorno ni backend.

## Actualizaciones de la APK

El endpoint publico de actualizacion es:

`https://crevi-loc-web.pages.dev/update.json`

La APK debe ir en:

`public/downloads/crevi-loc.apk`

Flujo recomendado de publicacion:

1. Sustituir `public/downloads/crevi-loc.apk`
2. Actualizar `public/update.json`
3. Hacer `git add`, `git commit` y `git push`
4. Esperar al nuevo despliegue de Cloudflare Pages

## Licencia

Este proyecto se distribuye bajo la licencia MIT. Consulta [LICENSE](./LICENSE).
