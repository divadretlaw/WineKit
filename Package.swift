// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WineKit",
    platforms: [.macOS(.v13)],
    products: [
        .library(
            name: "WineKit",
            targets: ["WineKit"]
        )
    ],
    targets: [
        .target(
            name: "WineKit"
        ),
        .testTarget(
            name: "WineKitTests",
            dependencies: ["WineKit"]
        )
    ]
)
