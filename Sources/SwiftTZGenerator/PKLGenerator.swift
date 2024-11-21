import Foundation

struct PKLGenerator {
  func generateSchema(from zones: [TZDBParser.Zone]) throws -> String {
    let enumCases = zones.map { zone in
      """
      new {
            name = "\(zone.identifier)"
            type = "\(zone.type == .now ? "now" : "zone1970")"
          }
      """
    }

    return """
    amends "timezone.pkl"

    import "name.pkl"

    timezone = new {
        \(enumCases.joined(separator: "\n    "))
    }
    """
  }
}
