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
        ),
        .library(
            name: "WindowsFileKit",
            targets: ["WindowsFileKit"]
        )
    ],
    targets: [
        .target(
            name: "WineKit", dependencies: ["WindowsFileKit"]
        ),
        .target(
            name: "WindowsFileKit"
        ),
        .testTarget(
            name: "WineKitTests",
            dependencies: ["WineKit"]
        ),
        .testTarget(
            name: "WindowsFileKitTests",
            dependencies: ["WindowsFileKit"],
            resources: [.process("Resources")]
        ),
        .plugin(
            name: "WinetricksPlugin",
            capability: .command(
                intent: .custom(verb: "winetricks-generate", description: "Generate enums from latest Winetricks verbs"),
                permissions: [.allowNetworkConnections(
                    scope: .all(),
                    reason: "Download latest verbs"
                )]
            )
        )
    ]
)
