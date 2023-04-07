// swift-tools-version: 5.5
import PackageDescription

let package = Package(
    name: "SwiftUIExtensions",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .macCatalyst(.v15),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "SwiftUIExtensions",
            targets: ["SwiftUIExtensions"]
        )
    ],
    targets: [
        .target(
            name: "SwiftUIExtensions",
            path: "Sources"
        ),
        .testTarget(
            name: "SwiftUIExtensionsTests",
            dependencies: ["SwiftUIExtensions"],
            path: "Tests"
        )
    ]
)
