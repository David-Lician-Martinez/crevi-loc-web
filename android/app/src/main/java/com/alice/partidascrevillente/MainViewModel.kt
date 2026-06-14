package com.alice.partidascrevillente

import android.app.Application
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch

data class UiState(
    val loading: Boolean = true,
    val partidaOptions: List<String> = emptyList(),
    val partidaText: String = "",
    val numberText: String = "",
    val suffixText: String = "",
    val result: SearchResult? = null,
    val partidaDisplayNameForResult: String? = null,
    val error: String? = null
)

class MainViewModel(app: Application) : AndroidViewModel(app) {
    private val repository = PartidasRepository(app)
    private lateinit var engine: SearchEngine

    private val _uiState = MutableStateFlow(UiState())
    val uiState: StateFlow<UiState> = _uiState.asStateFlow()

    init {
        viewModelScope.launch {
            try {
                val dataset = repository.loadDataset()
                val partidas = repository.loadPartidaDisplayNames().sorted()
                engine = SearchEngine(dataset, partidas)
                _uiState.value = _uiState.value.copy(loading = false, partidaOptions = partidas)
            } catch (t: Throwable) {
                _uiState.value = _uiState.value.copy(
                    loading = false,
                    error = "Error cargando datos: ${t.message ?: t::class.java.simpleName}"
                )
            }
        }
    }

    fun onPartidaChanged(value: String) {
        _uiState.value = _uiState.value.copy(partidaText = value)
    }

    fun onNumberChanged(value: String) {
        _uiState.value = _uiState.value.copy(numberText = value)
    }

    fun onSuffixChanged(value: String) {
        _uiState.value = _uiState.value.copy(suffixText = value)
    }

    fun search() {
        val state = _uiState.value
        if (!::engine.isInitialized) {
            _uiState.value = state.copy(error = "La app aún no ha terminado de cargar los datos", result = null)
            return
        }
        val input = engine.normalizeInput(state.partidaText, state.numberText, state.suffixText)
        if (input.isFailure) {
            _uiState.value = state.copy(error = input.exceptionOrNull()?.message, result = null)
            return
        }
        val normalized = input.getOrThrow()
        val result = engine.search(normalized)
        _uiState.value = state.copy(
            result = result,
            partidaDisplayNameForResult = normalized.partidaDisplayName,
            error = result.message
        )
    }

    fun mapsUrlFor(entry: AddressEntry): String = engine.buildMapsUrl(entry)
    fun shareTextFor(entry: AddressEntry): String = engine.buildShareText(_uiState.value.partidaDisplayNameForResult.orEmpty(), entry)
}
