import Foundation

struct TZDBParser {
  struct Zone {
    let identifier: String
    let description: String
  }

  func parseTimeZones() throws -> [Zone] {
    let url = URL(
      string: "https://raw.githubusercontent.com/eggert/tz/refs/heads/main/zonenow.tab")!
    let content = try String(contentsOf: url, encoding: .utf8)

    return content.components(separatedBy: .newlines)
      .filter { line in
        !line.isEmpty && !line.hasPrefix("#") && line.contains("\t")
      }
      .map { line in
        let fields = line.components(separatedBy: "\t")
        return Zone(
          identifier: fields[2],
          description: fields[3].trimmingCharacters(in: .whitespaces)
        )
      }
  }
}
