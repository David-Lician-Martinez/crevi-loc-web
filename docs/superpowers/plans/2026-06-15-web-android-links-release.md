# Web and Android Links Release Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Improve the responsive download links on the web and publish Android 1.0.1 with the new location aliases and bidirectional web/QR links.

**Architecture:** The web keeps a two-column CSS Grid controlled by the panel's content width and stacks only below 281px, which accounts for the page and panel padding on truly small screens. Android uses resource-qualified layouts: the base layout stacks the links for very small devices, while `layout-sw341dp` keeps them side by side. The current signed APK is archived in GitHub Release `v1.0.0` before the newly signed 1.0.1 APK replaces the public download.

**Tech Stack:** Vite, HTML/CSS, Node test runner, Android XML/Kotlin, Gradle, Git, GitHub Releases, Cloudflare Pages.

---

### Task 1: Responsive web links

**Files:**
- Modify: `index.html`
- Modify: `src/styles.css`
- Modify: `tests/web-download-links.test.mjs`

- [ ] Update the tests to require the corrected subtitle, shorter labels, container query and 281px internal threshold.
- [ ] Run `npm.cmd test` and confirm the new assertions fail.
- [ ] Update the HTML and CSS with the approved labels and responsive Grid.
- [ ] Run `npm.cmd test` and `npm.cmd run build` successfully.
- [ ] Verify desktop, narrow mobile and very-small mobile layouts.
- [ ] Commit and push the web-only delivery.

### Task 2: Archive Android 1.0.0

**Files:**
- Preserve as release asset: `public/downloads/crevi-loc.apk`

- [ ] Verify the current APK package, version and signing certificate.
- [ ] Create and push tag `v1.0.0` at the commit that contains the current public APK.
- [ ] Create GitHub Release `v1.0.0` and attach the exact current APK as `crevi-loc-1.0.0.apk`.
- [ ] Verify that the release asset is downloadable before replacing the public APK.

### Task 3: Android 1.0.1 links and data

**Files:**
- Modify: `android/app/build.gradle.kts`
- Modify: `android/app/src/main/java/com/alice/partidascrevillente/MainActivity.kt`
- Modify: `android/app/src/main/res/layout/activity_main.xml`
- Create: `android/app/src/main/res/layout/web_links.xml`
- Create: `android/app/src/main/res/layout-sw341dp/web_links.xml`
- Modify: `android/app/src/main/res/values/strings.xml`
- Modify: `android/app/src/test/java/com/alice/partidascrevillente/SearchEngineTest.kt`
- Create: `android/app/src/test/java/com/alice/partidascrevillente/WebLinksTest.kt`

- [ ] Add failing tests for Cañada Juana, Peña Sendra, web URL, QR URL and release version.
- [ ] Run the Android unit tests and confirm the new assertions fail.
- [ ] Add the two bottom links, browser intents and responsive resource layouts.
- [ ] Set `versionCode = 2` and `versionName = "1.0.1"`.
- [ ] Run unit tests, debug build and signed release build.

### Task 4: Publish Android 1.0.1

**Files:**
- Modify: `public/update.json`
- Replace: `public/downloads/crevi-loc.apk`

- [ ] Set update metadata to version 2 / 1.0.1, cache-busted APK URL and the approved notes.
- [ ] Copy the newly signed release APK over the public APK.
- [ ] Verify package, version, certificate and file hashes.
- [ ] Run all web tests and the production build.
- [ ] Commit and push the Android release delivery.
