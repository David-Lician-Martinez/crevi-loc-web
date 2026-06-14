package com.alice.partidascrevillente

import android.content.Context
import org.json.JSONObject

class PartidasRepository(private val context: Context) {

    fun loadDataset(): Dataset {
        val raw = context.assets.open("partidas.clean.json").bufferedReader().use { it.readText() }
        val root = JSONObject(raw)
        val result = linkedMapOf<String, List<AddressEntry>>()
        val keys = root.keys()
        while (keys.hasNext()) {
            val partidaId = keys.next()
            val array = root.getJSONArray(partidaId)
            val entries = buildList {
                for (i in 0 until array.length()) {
                    val obj = array.getJSONObject(i)
                    add(
                        AddressEntry(
                            code = obj.getString("code"),
                            number = obj.getString("number"),
                            suffix = obj.getString("suffix"),
                            lat = obj.getDouble("lat"),
                            lng = obj.getDouble("lng"),
                            googleMapsUrl = obj.getString("googleMapsUrl")
                        )
                    )
                }
            }
            result[partidaId] = entries
        }
        return result
    }

    fun loadPartidaDisplayNames(): List<String> {
        return context.assets.open("partidas.list.txt").bufferedReader().useLines { lines ->
            lines.map { it.trim() }.filter { it.isNotBlank() }.toList()
        }
    }
}
