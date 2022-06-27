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
        .package(url: "https://github.com/apple/swift-argument-parser", exact: "1.1.3"),
        .package(url: "https://github.com/JohnSundell/Files", exact: "4.2.0"),
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
            dependencies: [
                .product(name: "Files", package: "Files")
            ]
        ),
        .testTarget(
            name: "SharedHooksKitTests",
            dependencies: ["SharedHooksKit"]
        ),
    ]
)
