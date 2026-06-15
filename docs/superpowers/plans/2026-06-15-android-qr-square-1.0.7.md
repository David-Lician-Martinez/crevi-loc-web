# Android QR Square 1.0.7 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Publish Android 1.0.7 with a large square QR preview that uses the dialog width without vertical whitespace or intrinsic-size shrinking.

**Architecture:** Add a focused `SquareImageView` that measures its height from its resolved width. Use it only in the QR dialog, preserving `fitCenter`, rounded clipping, and the original downloadable PNG.

**Tech Stack:** Android Views, Kotlin, XML resources, Node test runner, Gradle.

---

### Task 1: Specify the square preview and release metadata

**Files:**
- Modify: `tests/android-release.test.mjs`

- [x] Require `SquareImageView` in `dialog_qr.xml` with `match_parent` width.
- [x] Require version code 8, version name 1.0.7, and APK URL cache key `v=8`.
- [x] Run `node --test tests/android-release.test.mjs` and confirm failure on the absent component and old metadata.

### Task 2: Implement the square preview

**Files:**
- Create: `android/app/src/main/java/com/alice/partidascrevillente/SquareImageView.kt`
- Modify: `android/app/src/main/res/layout/dialog_qr.xml`
- Modify: `android/app/src/main/res/layout/activity_main.xml`

- [x] Extend `AppCompatImageView` and override `onMeasure` so measured height equals measured width.
- [x] Replace the generic `ImageView` with the custom component while preserving the drawable, background, clipping, and `fitCenter` behavior.
- [x] Reduce only the main panel's top padding from 22dp to 12dp.
- [x] Run the focused test and confirm it passes.

### Task 3: Publish Android 1.0.7

**Files:**
- Modify: `android/app/build.gradle.kts`
- Modify: `public/update.json`
- Replace: `public/downloads/crevi-loc.apk`

- [x] Archive the current signed 1.0.6 APK as GitHub release `v1.0.6`.
- [x] Set `versionCode = 8`, `versionName = "1.0.7"`, and update metadata URL to `?v=8`.
- [x] Run `node --test` and Gradle unit tests plus `assembleRelease`.
- [x] Verify APK package, version, and signing certificate before replacing the public APK.
- [ ] Commit, push `main`, and verify Cloudflare serves the same APK hash.
