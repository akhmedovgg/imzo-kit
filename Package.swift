// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ImzoKit",
    products: [
        .library(
            name: "ImzoKit",
            targets: ["ImzoKit"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ImzoKit",
            dependencies: [],
            resources: [
                .copy("e-imzo.js")
            ]
        ),
        .testTarget(
            name: "ImzoKitTests",
            dependencies: ["ImzoKit"]
        ),
    ]
)
