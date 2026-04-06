# Crevi Loc Web

Versión web estática y móvil de Crevi Loc, preparada para subir a GitHub y desplegar directamente en Cloudflare Pages sin backend.

## Qué hace

- Busca por partida + número + letra opcional
- Redirige a Google Maps en el móvil
- Permite compartir la ubicación
- Guarda el tema claro/oscuro en el navegador
- Funciona como sitio estático

## Estructura

- `public/partidas.clean.json` → dataset limpio
- `public/partidas.list.txt` → listado visible de partidas
- `index.html` → shell principal
- `styles.css` → estilos
- `src/main.js` → lógica de la app
- `public/_redirects` → fallback SPA para Cloudflare Pages

## Desarrollo local

```bash
npm install
npm run dev
```

## Build local

```bash
npm install
npm run build
```

La salida queda en `dist/`.

## Deploy en Cloudflare Pages

### Opción simple desde GitHub

1. Sube **esta carpeta** como repositorio a GitHub.
2. En Cloudflare Pages, crea un proyecto nuevo conectado a ese repo.
3. Usa esta configuración:
   - Framework preset: `Vite`
   - Build command: `npm run build`
   - Build output directory: `dist`
4. Despliega.

### Opción arrastrando build manual

1. Ejecuta `npm install && npm run build`
2. Sube la carpeta `dist/` a Cloudflare Pages.

## Notas

- No hay backend ni base de datos.
- Toda la búsqueda ocurre en cliente.
- Está pensada para abrirse desde móvil.
- Google Maps se abre con URL directa usando coordenadas.

## Plug and play

El objetivo de esta carpeta es que puedas llevártela tal cual, subirla a GitHub, conectarla a Cloudflare Pages y desplegarla sin tener que reconstruir nada del proyecto Android.

## Archivos extra para dejarlo cerrado

- `CLOUDFLARE_PAGES.md` → configuración exacta para Pages
- `DEPLOY_CHECKLIST.md` → checklist rápida de puesta en producción
- `.nvmrc` y `.node-version` → Node 20 fijado
- `wrangler.toml` → metadata mínima compatible con Pages
