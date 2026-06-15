# Android QR Rollback 1.0.8 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Publish Android 1.0.8 with the last proven QR dialog and slightly tighter spacing below the search area.

**Architecture:** Restore the QR layout byte-for-byte in behavior to the stable 320dp `ImageView` design. Remove the experimental square view and adjust only the divider and link-container top margins.

**Tech Stack:** Android Views, XML resources, Node test runner, Gradle.

---

### Task 1: Lock the stable QR and spacing in tests

**Files:**
- Modify: `tests/android-release.test.mjs`

- [x] Require a standard `ImageView` with `320dp` height and reject `SquareImageView`.
- [x] Require divider margin `12dp` and both web-link margins `8dp`.
- [x] Require version code 9, version name 1.0.8, and APK URL `?v=9`.
- [x] Run the focused test and confirm it fails on all old values.

### Task 2: Restore and compact

**Files:**
- Delete: `android/app/src/main/java/com/alice/partidascrevillente/SquareImageView.kt`
- Modify: `android/app/src/main/res/layout/dialog_qr.xml`
- Modify: `android/app/src/main/res/layout/activity_main.xml`
- Modify: `android/app/src/main/res/layout/web_links.xml`
- Modify: `android/app/src/main/res/layout-sw341dp/web_links.xml`

- [x] Restore the stable `ImageView` with `320dp` height.
- [x] Set divider top margin to `12dp`.
- [x] Set both web-link container top margins to `8dp`.
- [x] Run the focused test and confirm it passes.

### Task 3: Publish 1.0.8

**Files:**
- Modify: `android/app/build.gradle.kts`
- Modify: `public/update.json`
- Replace: `public/downloads/crevi-loc.apk`

- [x] Archive the signed 1.0.7 APK in GitHub Releases.
- [x] Set version code 9 and version name 1.0.8.
- [x] Run all Node and Android unit tests plus `assembleRelease`.
- [x] Verify package metadata and signing certificate.
- [ ] Commit, push, and verify Cloudflare metadata and APK hash.
