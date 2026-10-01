# AGENTS.md

## Product mission

This repository contains **AstroLab**, the main application for **Project Meridian**. AstroLab is a native macOS 27 astronomy and astrophotography suite. The primary 1.0 goal is reliable core KStars/Ekos workflow parity on Apple Silicon, not visual imitation of KStars.

## Hard constraints

- All user-facing UI is SwiftUI.
- Objective-C is prohibited. Do not introduce Objective-C source, Objective-C++ shims, or Cocoa view-controller wrappers.
- Do not add Qt, KDE, Electron or a JavaScript application runtime.
- Use Swift 6 strict concurrency.
- macOS 27 is the minimum deployment target.
- Apple Silicon is the first supported architecture.
- Core imaging operation must not depend on cloud services or Internet access.
- Hardware I/O must never be owned by SwiftUI view lifetime.
- Domain logic belongs in the appropriate Project Meridian library instead of the app target.

## Current Project Meridian repositories

- AstroCore
- AstroCatalogKit
- SkyMapKit
- INDIKit
- AstroDeviceKit
- FITSKit

Do not use the superseded names `CatalogKit` or `DeviceKit`. The canonical repository and package names are `AstroCatalogKit` and `AstroDeviceKit`.

## Architectural boundaries

The app is the composition root. It may depend on Project Meridian kits, but kits must not depend on AstroLab.

Views consume observable presentation state and issue typed intents to coordinators and services. Do not place networking, device protocol handling, scheduler transitions, plate solving, guiding algorithms or image-processing kernels in a View or ViewModel.

Mutable hardware and workflow state must be isolated. Prefer actors for device connections, coordinators and long-running workflows. Use immutable `Sendable` snapshots or async event streams to feed UI state.

## Hardware safety

- Mount abort must remain available during any operation that can move the mount.
- Every hardware command needs cancellation and error handling, plus a bounded timeout where the protocol permits one.
- Automatic slews must pass through common safety validation.
- Weather and safety state overrides scheduler preference.
- Recovery code must not blindly repeat completed exposures or unsafe mount actions.

## Dependency policy

Use Apple frameworks first when they fit: SwiftUI, Foundation, Network.framework, Accelerate, Core Graphics, Core Image, ImageIO, Metal and Swift Charts.

CFITSIO is an accepted C dependency behind FITSKit. Other external dependencies require review for maintenance quality, license, API stability, security and replacement cost. Prefer Project Meridian-owned Swift implementations for strategically central behavior.

## Codex workflow

For localized work, read only the files required by the task. For changes that alter architecture, cross repository boundaries, introduce a workflow or state machine, or span multiple milestones, use an ExecPlan per `PLANS.md` and keep it current.

Use `timeline.md` to determine feature ordering. Do not implement secondary parity ahead of unresolved core-release blockers unless the task explicitly requests it.

Before finishing:

1. Build affected targets.
2. Run affected tests.
3. Add tests for changed behavior and failure paths.
4. Check strict-concurrency warnings.
5. Update documentation for public or user-visible changes.
6. Report simulator or hardware coverage that could not be run.

## 1.0 priority order

1. INDI connectivity and typed devices
2. Mount and camera control plus image display
3. Capture sequences
4. Native plate solving and alignment
5. Polar alignment
6. Autofocus
7. Guiding and dithering
8. Meridian flip recovery
9. Scheduler and safety
10. Session analysis, planning and core sky-map parity
11. Secondary planetarium, FITS and observatory parity

## Definition of done

A feature is done only when it is exercised through its appropriate layer, its error, cancellation and recovery paths are tested, UI remains responsive, and session or hardware state is not lost solely because a view is recreated.
