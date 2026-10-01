# AstroLab Architecture

## Product boundary

AstroLab is the application and composition root. Project Meridian domain capabilities are split into independent Swift package repositories so they can be tested, versioned and evolved without coupling their internals to SwiftUI application state.

## Current repository graph

AstroLab currently integrates:

- AstroCore
- AstroCatalogKit
- SkyMapKit
- INDIKit
- AstroDeviceKit
- FITSKit

Future workflow libraries described in `timeline.md` should be split out as their repository boundaries are finalized.

## Runtime layers

### Presentation

SwiftUI views, commands, settings, window and workspace state, and presentation models. Views render state and emit user intents.

### Application coordination

App-level composition and workflow wiring. This layer creates library clients and coordinators, translates library events into presentation snapshots, and manages app lifecycle. It does not reimplement library domain logic.

### Domain kits

Project Meridian packages contain astronomy math, catalogs, sky rendering, device abstractions, FITS access and, as development proceeds, image analysis, solving, capture, focus, guiding, alignment, scheduling, planning, telemetry and observatory safety.

### Hardware and transport

INDIKit owns INDI client transport. AstroDeviceKit maps dynamic INDI properties into typed capabilities. Hardware-facing workflow packages operate on those typed capabilities.

## Concurrency

- Each physical device connection is actor-isolated.
- Coordinators and state machines are actor-isolated when they own mutable workflow state.
- UI updates occur on `@MainActor`.
- Compute-heavy image work executes away from the main actor.
- Cross-layer updates use `Sendable` snapshots, results and async streams.

## Persistence

SQLite is preferred for durable structured state and large indexed datasets. Versioned JSON is preferred for portable configuration and interchange. Persisted session and capture progress must support recovery after process termination.

## Hardware command model

Every long-running command must define:

- initiation
- observable progress and state
- successful completion
- timeout behavior
- cancellation or abort behavior
- protocol and device error mapping
- disconnect behavior
- safe retry semantics

## No dependency cycles

Dependencies flow upward from foundations to workflows to AstroLab. The application can compose all packages. Lower-level packages must never import AstroLab or depend on higher-level modules to obtain convenience behavior.
