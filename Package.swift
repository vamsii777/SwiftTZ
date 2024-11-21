import CompilerPluginSupport
// swift-tools-version: 6.0
import PackageDescription

let package = Package(
  name: "SwiftTZ",
  platforms: [
    .macOS(.v13),
    .iOS(.v16),
    .watchOS(.v9),
    .tvOS(.v16),
    .macCatalyst(.v16),
    .visionOS(.v1),
  ],
  products: [
    .library(name: "SwiftTZ", targets: ["SwiftTZ"]),
    .executable(name: "tzdb-gen", targets: ["SwiftTZGenerator"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/pkl-swift.git", from: "0.3.0")
  ],
  targets: [
    // Generator executable
    .executableTarget(
      name: "SwiftTZGenerator",
      dependencies: [
        .product(name: "PklSwift", package: "pkl-swift")
      ]
    ),

    // Main library
    .target(
      name: "SwiftTZ",
      dependencies: [
        .product(name: "PklSwift", package: "pkl-swift")
      ]
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
