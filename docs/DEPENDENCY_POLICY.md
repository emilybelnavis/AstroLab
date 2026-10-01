# Dependency Policy

Project Meridian prefers first-party Swift implementations for core astronomy and automation behavior when external options are poorly maintained, licensing-constraining, opaque, or architecturally invasive.

## Preferred platform dependencies

Use these before third-party equivalents where they fit:

- Swift Standard Library
- SwiftUI
- Foundation
- Network.framework
- Accelerate, vDSP and vImage
- Core Graphics
- Core Image
- ImageIO
- Metal
- Swift Charts
- SQLite3

## Accepted foundational exception

FITSKit may wrap CFITSIO through a C module. CFITSIO stays behind FITSKit's Swift API and must not leak into higher layers.

## Review required

Every new third-party dependency must document:

1. Why first-party implementation is not appropriate.
2. Maintenance and release activity.
3. License and distribution implications.
4. Security and supply-chain considerations.
5. API or ABI stability.
6. Whether the dependency becomes an architectural choke point.
7. Removal and replacement cost.

## Prohibited by default

- Objective-C project code
- Objective-C++ bridging written for Project Meridian
- Qt or KDE framework dependencies
- Electron
- Embedded JavaScript runtimes for application UI
- Python runtime as a required shipping dependency
- Directly linked GPL components unless Project Meridian intentionally adopts compatible licensing after explicit review
