package com.alice.partidascrevillente

data class AddressEntry(
    val code: String,
    val number: String,
    val suffix: String,
    val lat: Double,
    val lng: Double,
    val googleMapsUrl: String
)

typealias Dataset = Map<String, List<AddressEntry>>

data class SearchInput(
    val partidaId: String,
    val partidaDisplayName: String,
    val number: Int,
    val suffix: String,
    val rawSuffixProvided: Boolean
)

enum class SearchStatus {
    EXACT_MATCH,
    FALLBACK_MATCH,
    MULTIPLE_CANDIDATES,
    NEARBY_SUGGESTIONS,
    NOT_FOUND,
    INVALID_INPUT
}

data class SearchResult(
    val status: SearchStatus,
    val entry: AddressEntry? = null,
    val candidates: List<AddressEntry> = emptyList(),
    val message: String? = null
)
