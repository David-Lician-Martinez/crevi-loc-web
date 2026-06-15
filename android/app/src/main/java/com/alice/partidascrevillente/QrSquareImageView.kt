package com.alice.partidascrevillente

import android.content.Context
import android.util.AttributeSet
import android.view.View
import androidx.appcompat.widget.AppCompatImageView

class QrSquareImageView @JvmOverloads constructor(
    context: Context,
    attrs: AttributeSet? = null,
    defStyleAttr: Int = 0
) : AppCompatImageView(context, attrs, defStyleAttr) {

    override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec)

        val widthMode = MeasureSpec.getMode(widthMeasureSpec)
        val widthSize = MeasureSpec.getSize(widthMeasureSpec)
        val heightMode = MeasureSpec.getMode(heightMeasureSpec)
        val heightSize = MeasureSpec.getSize(heightMeasureSpec)

        val availableWidth = if (widthMode == MeasureSpec.UNSPECIFIED) measuredWidth else widthSize
        val availableHeight = when (heightMode) {
            MeasureSpec.EXACTLY,
            MeasureSpec.AT_MOST -> heightSize
            else -> Int.MAX_VALUE
        }
        val boundedMaxWidth = if (maxWidth in 1 until Int.MAX_VALUE) maxWidth else Int.MAX_VALUE
        val boundedMaxHeight = if (maxHeight in 1 until Int.MAX_VALUE) maxHeight else Int.MAX_VALUE

        val size = listOf(availableWidth, availableHeight, boundedMaxWidth, boundedMaxHeight)
            .filter { it > 0 }
            .minOrNull()
            ?: measuredWidth.coerceAtLeast(measuredHeight)

        val exactSquareSpec = MeasureSpec.makeMeasureSpec(size, MeasureSpec.EXACTLY)
        super.onMeasure(exactSquareSpec, exactSquareSpec)
        setMeasuredDimension(size, size)
    }
}
