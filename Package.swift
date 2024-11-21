// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "swifttz",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .watchOS(.v9),
        .tvOS(.v16),
        .macCatalyst(.v16),
        .visionOS(.v1)
    ],
    products: [
        .library(name: "SwiftTZ", targets: ["SwiftTZ"]),
        .executable(name: "tzdb-gen", targets: ["SwiftTZGenerator"]),
    ],
    targets: [
        // Generator executable
        .executableTarget(
            name: "SwiftTZGenerator",
            dependencies: []
        ),
        
        // Main library
        .target(
            name: "SwiftTZ",
            dependencies: []
        ),
        
        // Tests
        .testTarget(
            name: "SwiftTZTests",
            dependencies: [
                "SwiftTZ"
            ]
        ),
    ]
)
