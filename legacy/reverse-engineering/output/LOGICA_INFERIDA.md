# Lógica inferida del APK original

## Clases detectadas

- `com.komeet.godemarcacion.crevillente.MainActivity`
- `com.komeet.godemarcacion.crevillente.BuscarVivienda`
- `com.komeet.godemarcacion.crevillente.OpcionesActivity`
- `com.komeet.godemarcacion.crevillente.AyudaActivity`

## Strings y pistas funcionales detectadas

- `Cargar partida...`
- `Si no pones una partida y un numero no sabremos donde quieres ir.`
- `Vivienda no encontrada, prueba con un numero cercano.`
- `textpartida`
- `textnumero`
- `textletra`
- `numeroobtenido`
- `letraobtenida`
- `radiomaps`
- `geo:0,0?q=`
- `https://www.google.es/maps/place/`
- `com.google.android.apps.maps`
- `com.sygic.aura://coordinate|`

## Flujo probablemente original

1. Elegir o cargar una `partida`
2. Introducir `número`
3. Introducir `letra` opcional
4. Construir una clave de búsqueda
5. Buscar en el fichero raw correspondiente a la partida
6. Si hay coordenadas válidas:
   - abrir Google Maps o app de navegación elegida
7. Si no hay coincidencia:
   - mostrar mensaje de vivienda no encontrada
   - sugerir un número cercano

## Formato de clave

Ejemplos:
- `0001X`
- `0026A`
- `0338B`

Interpretación:
- 4 dígitos de número con padding a la izquierda
- sufijo final:
  - `X` cuando no hay letra explícita / variante base
  - `A`, `B`, etc. para viviendas con letra

## Formato de datos

Cada fichero en `res/raw/<partida>` contiene:

```text
<codigo>:<lat>, <lng>
```

Ejemplo:

```text
0026A:38.242951, -0.816662
```

## Comportamiento recomendado a replicar

### Búsqueda exacta

Entrada usuario:
- partida: `san_antonio_de_la_florida`
- número: `26`
- letra: `A`

Normalización:
- número -> `0026`
- letra -> `A`
- clave -> `0026A`

Sin letra:
- clave primaria -> `0026X`

### Fallbacks útiles

Si no existe coincidencia exacta:
1. probar sin letra con `X`
2. si el usuario no indicó letra, mostrar variantes existentes del mismo número
3. ofrecer números cercanos ±1, ±2
4. ignorar espacios y mayúsculas en la entrada del usuario

## Mejoras para la nueva app

- selector/autocompletado de partidas
- búsqueda tolerante
- vista de resultados alternativos
- botón abrir en Google Maps
- botón compartir ubicación
- datos desacoplados del binario
- posibilidad futura de actualizar dataset sin tocar la app
