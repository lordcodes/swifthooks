// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "swifthooks",
    platforms: [.macOS(.v11)],
    products: [
        .executable(
            name: "tuist-hooks",
            targets: ["SwiftHooksCLI"]
        ),
        .executable(
            name: "swifthooks",
            targets: ["SwiftHooksCLI"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/JohnSundell/Files", exact: "4.2.0"),
    ],
    targets: [
        .executableTarget(
            name: "SwiftHooksCLI",
            dependencies: [
                .target(name: "SwiftHooksKit")
            ]
        ),
        .target(
            name: "SwiftHooksKit",
            dependencies: [
                .product(name: "Files", package: "Files")
            ]
        ),
        .testTarget(
            name: "SwiftHooksKitTests",
            dependencies: ["SwiftHooksKit"]
        ),
    ]
)
