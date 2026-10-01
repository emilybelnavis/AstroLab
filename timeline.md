# Project Meridian Timeline

This timeline assumes one experienced full-time engineer with strong automated-test coverage, coding-agent assistance and recurring access to real astrophotography hardware. The objective is **core KStars + Ekos workflow parity first**, followed by secondary planetarium and advanced-imaging parity.

## Release train

| Version | Target | Milestone | Feature scope | Exit gate |
| --- | --- | --- | --- | --- |
| 0 | Weeks 1-2 | Bootstrap | AstroLab shell, repository family, CI, strict-concurrency policy, logging conventions, simulator strategy | All active repos build; CI skeleton active; app launches |
| 0.1 | Months 1-2 | Hardware foundation | AstroCore baseline; INDIKit transport/XML/BLOB/replay; AstroDeviceKit registry/capabilities; mount basics; AstroLab equipment console | Connect to remote INDI; discover iEXOS; slew, track, park and abort |
| 0.2 | Months 3-4 | Planetarium foundation | AstroCatalogKit SQLite/indexing; SkyMapKit v1; time/location; object search; FOV overlays; telescope position | Interactive sky map with catalog search and live mount marker |
| 0.3 | Months 5-6 | Imaging foundation | FITSKit; image statistics, stretch, debayer and star metrics; camera control; capture preview and sequences | Execute and recover a basic light-frame sequence |
| 0.4 | Months 7-8 | Astrometry and alignment | Native constrained solver then blind solve; WCS; capture-and-solve; sync; iterative slew; polar alignment | 300 mm field solves reliably; slew-to-target converges; polar-alignment workflow usable |
| 0.5 | Month 9 | Autofocus | Star metrics, curve fitting, backlash and overscan, full-field focus, filter offsets and triggers | Repeatable unattended autofocus with diagnostics |
| 0.6 | Month 10 | Guiding | Calibration, single and multi-star guiding, pulse control, RMS telemetry, lost-star recovery, dithering | Stable guided capture with dither-and-settle |
| 0.7 | Month 11 | Capture automation | Focus, guide and capture coordination; guide-deviation gating; periodic refocus; meridian-flip state machine and recovery | Automated flip resumes alignment, guiding and remaining capture work |
| 0.8 | Month 12 | Scheduler and safety | Jobs, priorities, start/completion rules, altitude/twilight/Moon/horizon/weather constraints, startup/shutdown and retries | Unattended target job completes or safely aborts under simulated faults |
| 0.9 | Month 13 | Planning and telemetry | Event schema and timeline; visibility/framing/mosaic baseline; session history and recovery UI | Previous session can be reconstructed; planned target can become scheduler job |
| 0.10 | Month 14 | Core alpha | Full end-to-end integration and hardware soak testing on reference rig | Complete unattended night on supported hardware |
| 0.11 | Months 15-16 | Core hardening | Disconnect/restart recovery, bounded memory, performance, local INDI process option, failure injection and hardware matrix | Release-blocker defect rate low enough for public beta |
| 1.0 | End of Month 16 | Core stable | Supported core KStars/Ekos astrophotography replacement | All core release gates pass |
| 1.1 | Months 17-18 | Planetarium parity expansion | HiPS, terrain, satellites, asteroids, comets, transients, richer catalogs and astronomy tools | Broad main-KStars observing parity |
| 1.2 | Months 19-20 | Advanced imaging | Live stacking, calibration during stack, rejection algorithms, multi-channel combinations, advanced FITS analysis, tilt/aberration tools and video/SER | Advanced FITS and live-imaging workflows production-ready |
| 1.3 | Month 21 | Extensibility | Local automation API/MCP, plugin boundaries, scripting/CLI surfaces and remote read-only monitoring | Stable automation contract with permissions and tests |
| 1.x | Months 22-24 | Release hardening and parity closure | Accessibility, localization-ready strings, docs, installer/signing/notarization, migration/import, long soak tests and remaining parity gaps | Broad KStars/Ekos parity and mature release operations |

## Core 1.0 feature gate

AstroLab 1.0 cannot ship until all of the following are reliable:

- [ ] Create and persist an equipment profile and optical train.
- [ ] Connect to a remote INDI server and recover from disconnect or restart.
- [ ] Discover devices and capabilities dynamically.
- [ ] Control mount slew, tracking, abort, park/unpark, home and limits.
- [ ] Control imaging camera exposure, ISO/gain/offset, ROI/binning where available, cooler and transfer.
- [ ] Display downloaded FITS/native frames with statistics and useful stretch.
- [ ] Execute recoverable capture sequences for lights and calibration frames.
- [ ] Plate solve constrained fields and blind fields using the native solver.
- [ ] Iteratively slew to a solved target.
- [ ] Complete a three-frame polar-alignment workflow.
- [ ] Autofocus unattended and trigger refocus by configured policies.
- [ ] Calibrate and guide with subpixel correction telemetry.
- [ ] Dither and settle without corrupting capture sequencing.
- [ ] Perform a meridian flip and resume alignment, guiding and remaining captures.
- [ ] Schedule multiple jobs with altitude, twilight, Moon, horizon and weather constraints.
- [ ] Execute safe startup/shutdown procedures and weather aborts.
- [ ] Persist session telemetry and reconstruct the previous session.
- [ ] Recover capture/scheduler progress after app termination without duplicating completed exposures.
- [ ] Provide a basic interactive sky map, object search, live telescope marker and FOV overlay.
- [ ] Provide target visibility/framing planning sufficient to create scheduler jobs.

## Current repository ownership

| Area | Repository | Initial delivery |
| --- | --- | --- |
| Application shell and UI composition | AstroLab | 0.1 onward |
| Astronomy math | AstroCore | 0.1 |
| INDI transport | INDIKit | 0.1 |
| Typed hardware abstraction | AstroDeviceKit | 0.1 |
| Catalogs | AstroCatalogKit | 0.2 |
| Sky rendering | SkyMapKit | 0.2, expanded 1.1 |
| FITS | FITSKit | 0.3 |

The remaining workflow package repositories will be added as those boundaries are created.

## Staffing effect

With two experienced engineers, core stable is more realistically compressed to roughly 10-12 months and broad parity to roughly 15-18 months. With three to four engineers, core stable can plausibly move toward 8-10 months, provided hardware integration ownership is explicit. The native solver, guiding, cross-module automation and hardware failure recovery remain schedule-critical and do not scale linearly with headcount.

## Schedule risks

1. Native blind plate-solving performance and index design.
2. Guiding quality across mounts with different backlash and periodic-error characteristics.
3. Camera behavior differences exposed through INDI.
4. Recovery from partial device or network failure during automated sessions.
5. Meridian-flip coordination across mount, alignment, guiding, focus and capture.
6. Large-catalog rendering and indexing performance on the M1 baseline.
7. macOS 27 and Xcode 27 API or entitlement changes during development.

Timeline changes should update this file in the same pull request that changes milestone scope.
