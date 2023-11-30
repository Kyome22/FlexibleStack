// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "FlexibleStack",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "FlexibleStack",
            targets: ["FlexibleStack"]
        )
    ],
    targets: [
        .target(name: "FlexibleStack")
    ]
)
