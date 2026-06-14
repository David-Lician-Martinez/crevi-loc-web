package com.alice.partidascrevillente

import android.content.Context
import android.graphics.Color
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ArrayAdapter
import android.widget.TextView

class ThemeAwareSpinnerAdapter(
    context: Context,
    private val items: List<String>
) : ArrayAdapter<String>(context, R.layout.spinner_selected_item, items) {

    var darkTheme: Boolean = false

    override fun getCount(): Int = items.size

    override fun getItem(position: Int): String = items[position]

    override fun getView(position: Int, convertView: View?, parent: ViewGroup): View {
        val view = convertView ?: LayoutInflater.from(context)
            .inflate(R.layout.spinner_selected_item, parent, false)
        val text = view.findViewById<TextView>(android.R.id.text1)
        text.text = getItem(position)
        text.setTextColor(if (darkTheme) Color.parseColor("#F4F7FF") else Color.parseColor("#101528"))
        return view
    }

    override fun getDropDownView(position: Int, convertView: View?, parent: ViewGroup): View {
        val view = convertView ?: LayoutInflater.from(context)
            .inflate(R.layout.spinner_dropdown_item, parent, false)
        val text = view.findViewById<TextView>(android.R.id.text1)
        text.text = getItem(position)
        if (darkTheme) {
            view.setBackgroundColor(Color.parseColor("#232B47"))
            text.setTextColor(Color.parseColor("#F4F7FF"))
        } else {
            view.setBackgroundColor(Color.parseColor("#FBFCFF"))
            text.setTextColor(Color.parseColor("#101528"))
        }
        return view
    }
}
