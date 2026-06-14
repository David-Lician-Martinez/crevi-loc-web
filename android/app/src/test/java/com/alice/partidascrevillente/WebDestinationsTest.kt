package com.alice.partidascrevillente

import org.junit.Assert.assertEquals
import org.junit.Test

class WebDestinationsTest {
    @Test
    fun exposesThePublicWebAndQrUrls() {
        assertEquals("https://crevi-loc-web.pages.dev/", WebDestinations.WEB_URL)
        assertEquals(
            "https://crevi-loc-web.pages.dev/downloads/crevi-loc-web-qr.png",
            WebDestinations.QR_URL
        )
    }
}
