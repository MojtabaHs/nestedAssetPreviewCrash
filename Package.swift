// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Z",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    
    products: [
        .library(
            name: "A",
            targets: ["A"]),

        .library(
            name: "B",
            targets: ["B"]),
    ],

    targets: [
        .target(
            name: "A",
            dependencies: [],
            resources: [.process("Resources")]),

        .target(
            name: "B",
            dependencies: ["A"]),
    ]
)
