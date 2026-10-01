// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "AstroLab",
    platforms: [.macOS(.v27)],
    products: [
        .executable(name: "AstroLab", targets: ["AstroLabApp"])
    ],
    dependencies: [
        .package(url: "https://github.com/emilybelnavis/AstroCore.git", branch: "main"),
        .package(url: "https://github.com/emilybelnavis/AstroCatalogKit.git", branch: "main"),
        .package(url: "https://github.com/emilybelnavis/SkyMapKit.git", branch: "main"),
        .package(url: "https://github.com/emilybelnavis/INDIKit.git", branch: "main"),
        .package(url: "https://github.com/emilybelnavis/AstroDeviceKit.git", branch: "main"),
        .package(url: "https://github.com/emilybelnavis/FITSKit.git", branch: "main")
    ],
    targets: [
        .executableTarget(
            name: "AstroLabApp",
            dependencies: [
                .product(name: "AstroCore", package: "AstroCore"),
                .product(name: "AstroCatalogKit", package: "AstroCatalogKit"),
                .product(name: "SkyMapKit", package: "SkyMapKit"),
                .product(name: "INDIKit", package: "INDIKit"),
                .product(name: "AstroDeviceKit", package: "AstroDeviceKit"),
                .product(name: "FITSKit", package: "FITSKit")
            ]
        ),
        .testTarget(
            name: "AstroLabAppTests",
            dependencies: ["AstroLabApp"]
        )
    ]
)
