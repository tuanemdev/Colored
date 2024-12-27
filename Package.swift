// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Colored",
    products: [
        .library(
            name: "Colored",
            targets: ["Colored"]
        ),
    ],
    targets: [
        .target(
            name: "Colored"
        ),
        .testTarget(
            name: "ColoredTests",
            dependencies: ["Colored"]
        ),
    ]
)
