// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Grid",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "Grid",
            targets: ["Grid"]),
    ],
    dependencies: [
        .package(url: "https://github.com/majidboudaoud/ColumnLayout.git", from: "1.0.1-alpha1"),
    ],
    targets: [
        .target(
            name: "Grid",
            dependencies: ["ColumnLayout"]),
        .testTarget(
            name: "GridTests",
            dependencies: ["Grid"]),
    ]
)
