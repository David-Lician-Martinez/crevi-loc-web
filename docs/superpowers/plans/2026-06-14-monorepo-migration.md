# Crevi Loc Monorepo Migration Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Consolidate the Cloudflare web app, maintainable Android project, legacy APK evidence, local release signing material, and release workflow in one Windows-hosted repository.

**Architecture:** Keep the Vite web app at the repository root so Cloudflare continues publishing only `dist`. Store Android sources under `android/`, legacy reverse-engineering evidence under `legacy/`, and release secrets under ignored `signing/`. Only the current Android APK and downloadable web QR live under `public/downloads/`.

**Tech Stack:** Vite 5, vanilla JavaScript/CSS, Cloudflare Pages, Kotlin, Android Gradle Plugin, Gradle Wrapper, Android SDK 35, GitHub Releases.

---

### Task 1: Add repository safety boundaries

**Files:**
- Modify: `.gitignore`
- Create: `signing/README.md`
- Create locally only: `signing/release-keystore.jks`
- Create locally only: `signing/keystore.properties`

- [ ] Add ignores for Android build output, Gradle caches, signing credentials, local SDK paths, and local APK archives.
- [ ] Copy the official keystore and properties from the VM into the ignored `signing/` directory.
- [ ] Verify `git status --short --ignored` marks both secret files as ignored.
- [ ] Verify the copied keystore certificate SHA-256 is `D34633BCEC7D033483EA9292EB8E4E4CB9E7A723A288C730C963252EF7FB38D9`.

### Task 2: Migrate the Android project

**Files:**
- Create: `android/`
- Modify: `android/app/build.gradle.kts`
- Create: `android/README.md`

- [ ] Copy project sources, Gradle Wrapper, resources, and configuration from `/home/openclaw/.openclaw/workspace/new_app`.
- [ ] Exclude `.gradle/`, `.kotlin/`, `app/build/`, and signing secrets.
- [ ] Point release signing configuration at `../signing/keystore.properties` without embedding credentials.
- [ ] Add a Windows-oriented README covering setup, debug, release, versioning, signing, and publication.
- [ ] Run `gradlew.bat signingReport` and confirm release certificate identity.
- [ ] Run Android unit tests and release assembly when dependencies are available.

### Task 3: Preserve legacy application evidence

**Files:**
- Create: `legacy/base.apk`
- Create: `legacy/reverse-engineering/`
- Create: `legacy/README.md`

- [ ] Move `C:\Users\David\Downloads\base.apk` to `legacy/base.apk`.
- [ ] Verify package `com.komeet.godemarcacion.crevillente`, version code `205`, version name `2.05`.
- [ ] Copy useful extracted resources, decompiled sources, reconstruction notes, and generated datasets from VM `apk_work`.
- [ ] Exclude downloaded JADX/Apktool binaries and transient build output.
- [ ] Document that decompiled code is reference material, not the maintainable Crevi Loc source.

### Task 4: Add web download links with TDD

**Files:**
- Create: `tests/web-download-links.test.mjs`
- Modify: `package.json`
- Modify: `index.html`
- Modify: `src/styles.css`
- Move: `qr_web.png` to `public/downloads/crevi-loc-web-qr.png`
- Move: `location-logo.jpg` to `assets/qr/location-logo.jpg`

- [ ] Write tests requiring an APK download link and a QR download link with stable paths and download attributes.
- [ ] Run `npm test` and verify failure because the links do not exist.
- [ ] Add centered left/right download links beneath the search panel content.
- [ ] Add responsive styling that stacks links on narrow screens.
- [ ] Run `npm test` and verify both tests pass.
- [ ] Run `npm run build` and verify both downloadable files are present under `dist/downloads/`.

### Task 5: Document the repository and release workflow

**Files:**
- Rewrite: `README.md`
- Create: `docs/RELEASE_PROCESS.md`
- Create: `docs/RECOVERY.md`

- [ ] Explain repository layout, Cloudflare boundaries, GitHub responsibilities, and secret handling.
- [ ] Document version increments, release build, signature verification, GitHub Release upload, APK replacement, `update.json` update, web build, and deployment.
- [ ] Document recovery requirements and backups for the keystore and credentials.
- [ ] Ensure no documentation contains live passwords.

### Task 6: Final verification and commit

- [ ] Verify no secrets are tracked or staged.
- [ ] Verify APK signatures and metadata for legacy and current APKs.
- [ ] Run web tests and production build.
- [ ] Run Android signing report, tests, and release build.
- [ ] Review `git diff --check`, `git status`, and staged content.
- [ ] Commit the migration and web download links in one explanatory commit.
