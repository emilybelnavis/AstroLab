# Contributing

Project Meridian targets macOS 27 and Apple Silicon. All production UI is SwiftUI. Objective-C is prohibited.

## Development rules

- Use Swift 6 language mode and strict concurrency.
- Prefer value types and `Sendable` models for snapshots and events.
- Put mutable hardware or transport state behind actors.
- Do not block the main actor on network, device or image-processing work.
- Avoid force unwraps and `try!` in production code.
- Public APIs require doc comments and tests.
- State machines require transition tests.
- New third-party dependencies require a written rationale in the pull request.
- Fixes for reproducible hardware or protocol bugs should include transcript, simulator or regression fixtures when feasible.

## Before opening a pull request

```sh
swift build
swift test
```

Also run any integration or hardware tests affected by the change. Document tests that could not be run.
