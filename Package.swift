// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "FlexibleStack",
    platforms: [
        .iOS("16.4"),
    ],
    products: [
        .library(
            name: "FlexibleStack",
            targets: ["FlexibleStack"]
        ),
    ],
    targets: [
        .target(
            name: "FlexibleStack",
            swiftSettings: [.enableUpcomingFeature("ExistentialAny")]
        ),
    ]
)
