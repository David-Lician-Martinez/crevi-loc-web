package com.alice.partidascrevillente

import java.text.Normalizer
import kotlin.math.abs

class SearchEngine(
    private val dataset: Dataset,
    private val partidaDisplayNames: List<String>
) {
    private val displayToId: Map<String, String> = partidaDisplayNames.associateBy(
        keySelector = { normalizeText(it) },
        valueTransform = { matchDatasetPartidaId(it) }
    )

    fun normalizeInput(partidaText: String, numberText: String, suffixText: String): Result<SearchInput> {
        val partidaKey = normalizeText(partidaText)
        val partidaId = displayToId[partidaKey]
            ?: return Result.failure(IllegalArgumentException("Partida no válida"))

        val partidaDisplay = partidaDisplayNames.first { toPartidaId(it) == partidaId }
        val number = numberText.trim().toIntOrNull()
            ?: return Result.failure(IllegalArgumentException("Número no válido"))

        val rawSuffix = suffixText.trim()
        val suffix = if (rawSuffix.isBlank()) "X" else rawSuffix.uppercase()

        return Result.success(
            SearchInput(
                partidaId = partidaId,
                partidaDisplayName = partidaDisplay,
                number = number,
                suffix = suffix,
                rawSuffixProvided = rawSuffix.isNotBlank()
            )
        )
    }

    fun search(input: SearchInput): SearchResult {
        val entries = dataset[input.partidaId].orEmpty()
        if (entries.isEmpty()) return SearchResult(SearchStatus.NOT_FOUND, message = "No hay datos para esa partida")

        val sameNumber = entries.filter { it.number.toIntOrNull() == input.number }.sortedBy { it.suffix }
        val exact = sameNumber.firstOrNull { it.suffix.equals(input.suffix, ignoreCase = true) }
        if (exact != null) return SearchResult(SearchStatus.EXACT_MATCH, entry = exact)

        if (input.rawSuffixProvided) {
            val fallbackX = sameNumber.firstOrNull { it.suffix.equals("X", ignoreCase = true) }
            if (fallbackX != null) return SearchResult(SearchStatus.FALLBACK_MATCH, entry = fallbackX, message = "No existe esa letra; se muestra la variante base")
        } else if (sameNumber.size > 1) {
            return SearchResult(SearchStatus.MULTIPLE_CANDIDATES, candidates = sameNumber, message = "Hay varias viviendas para ese número")
        }

        if (sameNumber.isNotEmpty()) {
            return SearchResult(SearchStatus.MULTIPLE_CANDIDATES, candidates = sameNumber, message = "Hay variantes disponibles para ese número")
        }

        val nearby = entries
            .filter { it.number.toIntOrNull() != null }
            .sortedBy { abs(it.number.toInt() - input.number) }
            .take(8)

        return if (nearby.isNotEmpty()) {
            SearchResult(SearchStatus.NEARBY_SUGGESTIONS, candidates = nearby, message = "No hay coincidencia exacta; se muestran números cercanos")
        } else {
            SearchResult(SearchStatus.NOT_FOUND, message = "No se encontró la vivienda")
        }
    }

    fun buildMapsUrl(entry: AddressEntry): String =
        "https://www.google.com/maps/search/?api=1&query=${entry.lat},${entry.lng}"

    fun buildShareText(partidaDisplayName: String, entry: AddressEntry): String {
        val suffix = if (entry.suffix.equals("X", ignoreCase = true)) "" else entry.suffix
        val displayNumber = entry.number.toIntOrNull()?.toString() ?: entry.number.trimStart('0').ifBlank { entry.number }
        return "PTDA. $partidaDisplayName ${displayNumber}$suffix\n${buildMapsUrl(entry)}"
    }

    private fun toPartidaId(display: String): String =
        normalizeText(display).replace(' ', '_')

    private fun matchDatasetPartidaId(display: String): String {
        val wanted = toPartidaId(display)
        return dataset.keys.firstOrNull { normalizeText(it) == normalizeText(wanted) } ?: wanted
    }

    private fun normalizeText(value: String): String {
        val asciiEnye = value.trim().lowercase().replace("ñ", "ny")
        val normalized = Normalizer.normalize(asciiEnye, Normalizer.Form.NFD)
        return normalized
            .replace("\\p{InCombiningDiacriticalMarks}+".toRegex(), "")
            .replace(Regex("\\s+"), " ")
    }
}
