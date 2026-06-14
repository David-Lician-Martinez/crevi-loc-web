# Modelo limpio para la app nueva

## Objetivo

Sustituir la lógica rígida de la app vieja por un modelo claro, mantenible y extensible, manteniendo compatibilidad funcional con los datos históricos.

---

## 1. Problemas del modelo viejo

La app original funcionaba, pero tenía limitaciones fuertes:

- dependía de ficheros de texto crudos en `res/raw/`
- buscaba mediante `substring()` en posiciones fijas
- asumía un formato rígido exacto de línea
- usaba `x` como letra por defecto de forma implícita
- no ofrecía resultados alternativos estructurados
- mezclaba UI, parsing, búsqueda y navegación en la misma clase
- no estaba preparada para evolución o validación de datos

---

## 2. Modelo nuevo propuesto

Separar claramente:

1. **datos**
2. **normalización de entrada**
3. **motor de búsqueda**
4. **resolución de resultados**
5. **navegación/compartir**
6. **UI**

---

## 3. Modelo de datos

### 3.1 Entidad `Partida`

```json
{
  "id": "san_antonio_de_la_florida",
  "displayName": "SAN ANTONIO DE LA FLORIDA",
  "aliases": ["San Antonio de la Florida", "san antonio de la florida"],
  "entries": []
}
```

Campos:
- `id`: identificador interno estable
- `displayName`: nombre visible al usuario
- `aliases`: opcional, para búsquedas tolerantes
- `entries`: lista de viviendas/localizaciones

### 3.2 Entidad `AddressEntry`

```json
{
  "code": "0026A",
  "number": 26,
  "suffix": "A",
  "lat": 38.242951,
  "lng": -0.816662,
  "label": "PTDA. SAN ANTONIO DE LA FLORIDA 26A"
}
```

Campos:
- `code`: código histórico completo
- `number`: número numérico
- `suffix`: letra/sufijo (`X`, `A`, `B`, etc.)
- `lat`, `lng`: coordenadas
- `label`: etiqueta amigable para UI/compartir

### 3.3 Dataset raíz

```json
{
  "version": 1,
  "source": "base.apk recovered dataset",
  "partidas": [ ... ]
}
```

Esto permite versionar el dataset en el futuro.

---

## 4. Normalización de entrada

### Entrada del usuario

```json
{
  "partida": "San Antonio de la Florida",
  "number": "26",
  "suffix": "a"
}
```

### Reglas de normalización

- `partida`
  - trim
  - uppercase/lowercase insensible
  - opcionalmente quitar acentos para búsqueda interna
  - resolver contra `displayName` y `aliases`

- `number`
  - trim
  - convertir a entero
  - rechazar vacío o no numérico

- `suffix`
  - trim
  - uppercase
  - si viene vacío -> usar `X` como valor por defecto funcional, pero **solo internamente**

### Resultado normalizado

```json
{
  "partidaId": "san_antonio_de_la_florida",
  "number": 26,
  "suffix": "A"
}
```

---

## 5. Motor de búsqueda

### 5.1 Búsqueda exacta

Buscar entrada por:
- `partidaId`
- `number`
- `suffix`

Regla principal:
1. si el usuario indicó letra -> buscar exacta
2. si no indicó letra -> buscar `X`

### 5.2 Fallbacks útiles

Si no hay coincidencia exacta:

#### Caso A: usuario NO indicó letra
1. buscar `X`
2. si no existe, buscar todas las variantes del mismo número (`A`, `B`, etc.)
3. si no existe el número, sugerir cercanos

#### Caso B: usuario SÍ indicó letra
1. buscar exacta
2. si no existe, buscar el mismo número con `X`
3. si tampoco, mostrar variantes disponibles de ese número
4. si tampoco, sugerir números cercanos

### 5.3 Números cercanos

Propuesta:
- primero mismo número con otros sufijos
- luego ±1
- luego ±2
- luego ±3

Esto debe devolver sugerencias ordenadas, no solo un error plano.

---

## 6. Resultado de búsqueda

En vez de devolver solo coordenadas o fallo, devolver un objeto rico:

```json
{
  "status": "exact_match",
  "entry": {
    "code": "0026A",
    "number": 26,
    "suffix": "A",
    "lat": 38.242951,
    "lng": -0.816662,
    "label": "PTDA. SAN ANTONIO DE LA FLORIDA 26A"
  },
  "alternatives": []
}
```

Estados posibles:
- `exact_match`
- `fallback_match`
- `multiple_candidates`
- `nearby_suggestions`
- `not_found`
- `invalid_input`

---

## 7. Navegación y compartir

### Navegación moderna

Evitar hardcodear clases internas antiguas de Google Maps.

Preferir:

```text
https://www.google.com/maps/search/?api=1&query=<lat>,<lng>
```

Fallback:

```text
geo:0,0?q=<lat>,<lng>(<label>)
```

### Compartir

Texto propuesto:

```text
PTDA. SAN ANTONIO DE LA FLORIDA 26A
https://www.google.com/maps/search/?api=1&query=38.242951,-0.816662
```

### Navegadores

La app nueva puede soportar:
- Google Maps
- cualquier app que maneje `geo:`
- compartir ubicación

Sygic puede dejarse como mejora opcional, no como dependencia central.

---

## 8. UI moderna recomendada

Pantalla única con:

- selector/autocomplete de partida
- campo número
- campo letra opcional
- botón `Buscar`
- tarjeta de resultado
- botón `Abrir en Maps`
- botón `Compartir`
- sección de sugerencias si no hay match exacto

Mejor que la app vieja porque:
- no depende de diálogos toscos
- no obliga a memorizar formato
- explica mejor los fallos
- ofrece alternativas reales

---

## 9. Reglas de compatibilidad con datos históricos

Para no romper compatibilidad:
- conservar `code` histórico
- conservar `X` como sufijo por defecto interno
- mantener nombres de partidas originales
- tratar placeholders `00000000000000000000` como entradas inválidas y excluirlos del dataset operativo

---

## 10. Arquitectura recomendada

### Capa de datos
- `PartidaRepository`
- lectura de JSON desde `assets`

### Capa de dominio
- `NormalizeInputUseCase`
- `FindAddressUseCase`
- `BuildNavigationLinkUseCase`
- `BuildShareTextUseCase`

### Capa UI
- `SearchScreen`
- `SearchViewModel`
- `SearchUiState`

---

## 11. Comportamiento final esperado

Ejemplo:

Entrada:
- partida: `SAN ANTONIO DE LA FLORIDA`
- número: `26`
- letra: vacío

Resolución:
- intenta `26X`
- si existe -> abre resultado
- si no existe -> muestra `26A`, `26B`, etc. si están disponibles
- si tampoco -> sugiere `25`, `27`, `24`, `28`

Esto es mucho más robusto que la app original.

---

## 12. Decisión práctica

La app nueva debe ser:
- **100% local para consultar datos**
- **moderna en UI**
- **tolerante en búsqueda**
- **independiente de hacks antiguos**
- **lista para actualizar dataset en el futuro**

Ese es el modelo limpio que conviene implementar.
