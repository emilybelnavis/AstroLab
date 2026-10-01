# AstroLab

**AstroLab** is the main application in **Project Meridian**, a native macOS 27 astronomy and astrophotography suite designed to replace the core KStars + Ekos workflow on Apple Silicon.

The 1.0 product goal is a reliable end-to-end imaging workflow:

> connect rig → control mount/camera → polar align → focus → plate solve → guide → capture → dither → meridian flip → resume → schedule targets → shut down safely

## Non-negotiable constraints

- macOS 27 minimum deployment target
- Apple Silicon first
- SwiftUI for all user-facing UI
- No Objective-C
- No Qt/KDE or Electron
- Swift 6 strict concurrency
- INDI is the initial hardware boundary
- Core imaging workflows must work offline
- Domain libraries live in separate repositories

## Project Meridian repositories

- [AstroCore](https://github.com/emilybelnavis/AstroCore)
- [AstroCatalogKit](https://github.com/emilybelnavis/AstroCatalogKit)
- [SkyMapKit](https://github.com/emilybelnavis/SkyMapKit)
- [INDIKit](https://github.com/emilybelnavis/INDIKit)
- [AstroDeviceKit](https://github.com/emilybelnavis/AstroDeviceKit)
- [FITSKit](https://github.com/emilybelnavis/FITSKit)

Additional workflow libraries from the Project Meridian specification will be split into repositories as they are brought online.

## Repository role

This repository owns the AstroLab application shell, composition root, navigation, user settings, workspace restoration and user-facing integration of Project Meridian libraries. Domain logic belongs in the appropriate library repository.

## Development

The initial scaffold uses Swift Package Manager as a buildable application shell. The shipping macOS app may add an Xcode project for app signing, entitlements and release packaging without moving domain logic into the app target.

```sh
swift build
swift test
```

See:

- `AGENTS.md` for Codex and contributor rules
- `PLANS.md` for substantial execution plans
- `docs/ARCHITECTURE.md` for package and runtime architecture
- `docs/DEPENDENCY_POLICY.md` for dependency rules
- `timeline.md` for the implementation timeline and feature gates

## Status

Initial Project Meridian scaffold. The project is pre-1.0 and APIs and workflows will evolve aggressively until core astrophotography parity is achieved.
