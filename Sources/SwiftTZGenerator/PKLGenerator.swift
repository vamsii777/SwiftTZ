import Foundation

struct PKLGenerator {
  func generateSchema(from zones: [TZDBParser.Zone]) throws -> String {
    // Create simple union of string literals
    let enumCases = zones.map { zone in
      "\"\(zone.identifier)\""  // Keep original IANA identifiers
    }

    return """
      @swift.Name { value = "TimeZoneModule" }
      module TimeZoneModule

      import "package://pkg.pkl-lang.org/pkl-swift/pkl.swift@0.3.0#/swift.pkl"

      /// All supported IANA timezone identifiers
      typealias TimeZoneIdentifier = \(enumCases.joined(separator: " | "))

      /// Default timezone for the current system
      defaultTimeZone: TimeZoneIdentifier = "UTC"
      """
  }
}
