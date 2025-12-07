// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "feather-push",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9),
        .visionOS(.v1),
    ],
    products: [
        .library(name: "FeatherPush", targets: ["FeatherPush"]),
        .library(name: "XCTFeatherPush", targets: ["XCTFeatherPush"]),
    ],
    dependencies: [
        .package(url: "https://github.com/feather-framework/feather-component.git",  .upToNextMinor(from: "0.5.0")),
        .package(url: "https://github.com/swiftlang/swift-docc-plugin", from: "1.4.0"),
    ],
    targets: [
        .target(
            name: "FeatherPush",
            dependencies: [
                .product(name: "FeatherComponent", package: "feather-component")
            ]
        ),
        .target(
            name: "XCTFeatherPush",
            dependencies: [
                .target(name: "FeatherPush"),
            ],
            resources: [
                .copy("Assets/feather.png")
            ]
        ),
        .testTarget(
            name: "FeatherPushTests",
            dependencies: [
                .target(name: "FeatherPush"),
            ]
        ),
        .testTarget(
            name: "XCTFeatherPushTests",
            dependencies: [
                .target(name: "XCTFeatherPush"),
            ]
        ),
    ]
)
