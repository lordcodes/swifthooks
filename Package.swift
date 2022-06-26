// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "sharedhooks-swift",
    platforms: [.macOS(.v11)],
    products: [
        .executable(
            name: "tuist-hooks",
            targets: ["SharedHooks"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", exact: "1.1.3")
    ],
    targets: [
        .executableTarget(
            name: "SharedHooks",
            dependencies: [
                .target(name: "SharedHooksKit"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .target(
            name: "SharedHooksKit",
            dependencies: []
        ),
        .testTarget(
            name: "SharedHooksKitTests",
            dependencies: ["SharedHooksKit"]
        ),
    ]
)
