package com.alice.partidascrevillente

import org.junit.Assert.assertEquals
import org.junit.Test

class SearchEngineTest {
    private val entry = AddressEntry(
        code = "0001X",
        number = "0001",
        suffix = "X",
        lat = 38.0,
        lng = -0.8,
        googleMapsUrl = "https://example.com"
    )

    @Test
    fun visibleNamesWithEnyeResolveToStableAsciiKeys() {
        val engine = SearchEngine(
            dataset = mapOf(
                "canyada_juana" to listOf(entry),
                "penya_sendra" to listOf(entry)
            ),
            partidaDisplayNames = listOf("CAÑADA JUANA", "PEÑA SENDRA")
        )

        assertEquals(
            "canyada_juana",
            engine.normalizeInput("CAÑADA JUANA", "1", "").getOrThrow().partidaId
        )
        assertEquals(
            "penya_sendra",
            engine.normalizeInput("PEÑA SENDRA", "1", "").getOrThrow().partidaId
        )

        assertEquals(
            SearchStatus.EXACT_MATCH,
            engine.search(engine.normalizeInput("CAÑADA JUANA", "1", "").getOrThrow()).status
        )
        assertEquals(
            SearchStatus.EXACT_MATCH,
            engine.search(engine.normalizeInput("PEÑA SENDRA", "1", "").getOrThrow()).status
        )
    }
}
