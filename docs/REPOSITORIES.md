# Project Meridian Repository Map

## Current repositories

- [AstroLab](https://github.com/emilybelnavis/AstroLab): main macOS application and composition root
- [AstroCore](https://github.com/emilybelnavis/AstroCore): astronomy math, coordinates, time and observing geometry
- [AstroCatalogKit](https://github.com/emilybelnavis/AstroCatalogKit): catalog storage, indexing and search
- [SkyMapKit](https://github.com/emilybelnavis/SkyMapKit): interactive native sky rendering
- [INDIKit](https://github.com/emilybelnavis/INDIKit): pure Swift INDI transport and protocol client
- [AstroDeviceKit](https://github.com/emilybelnavis/AstroDeviceKit): typed astronomy hardware abstractions
- [FITSKit](https://github.com/emilybelnavis/FITSKit): FITS and WCS boundary

The names `CatalogKit` and `DeviceKit` are retired. Use `AstroCatalogKit` and `AstroDeviceKit` in code, documentation and package dependencies.

## Planned package boundaries

The Project Meridian specification also calls for first-party image analysis, plate solving, mount domain logic, capture, focus, guiding, alignment, scheduling, planning, analysis and observatory safety packages. Their repository names should be finalized before AstroLab adds package dependencies on them.

AstroLab is the sole application composition root. Repositories must preserve a directed dependency graph and avoid circular package dependencies.
