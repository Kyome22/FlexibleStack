// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "FlexibleStack",
    platforms: [
        .iOS("16.4")
    ],
    products: [
        .library(
            name: "FlexibleStack",
            targets: ["FlexibleStack"]
        )
    ],
    targets: [
        .target(
            name: "FlexibleStack",
            resources: [.copy("PrivacyInfo.xcprivacy")]
        )
    ]
)
