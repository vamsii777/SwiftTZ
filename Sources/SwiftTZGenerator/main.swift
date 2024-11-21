import Foundation
import PklSwift

struct TZDBGenerator {
  static func main() async throws {
    // Parse IANA database
    let parser = TZDBParser()
    let zones = try parser.parseTimeZones()

    // Generate PKL schema
    let generator = PKLGenerator()
    let schema = try generator.generateSchema(from: zones)

    // Write PKL file
    let pklPath = "Sources/pkl/TimeZones.pkl"
    try schema.write(
      to: URL(fileURLWithPath: pklPath),
      atomically: true,
      encoding: .utf8
    )

    // Generate Swift code using pkl-gen-swift from current directory
    let process = Process()
    process.currentDirectoryPath = FileManager.default.currentDirectoryPath
    process.executableURL = URL(fileURLWithPath: "./pkl-gen-swift")
    process.arguments = [
      pklPath,
      "-o", "Sources/SwiftTZ/Generated/",
    ]
    try process.run()
    process.waitUntilExit()

    print("✅ Generated PKL schema and Swift code")
  }
}

// Entry point
try await TZDBGenerator.main()
