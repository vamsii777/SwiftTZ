import Foundation

enum ZoneType {
    case now
    case zone1970
    
    var url: URL {
        switch self {
        case .now:
            return URL(string: "https://raw.githubusercontent.com/eggert/tz/refs/heads/main/zonenow.tab")!
        case .zone1970:
            return URL(string: "https://raw.githubusercontent.com/eggert/tz/refs/heads/main/zone1970.tab")!
        }
    }
}

struct TZDBParser {
    struct Zone: Hashable {
        let identifier: String
        let description: String
        let type: ZoneType
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(identifier)
        }
        
        static func == (lhs: Zone, rhs: Zone) -> Bool {
            return lhs.identifier == rhs.identifier
        }
    }
    
    func parseTimeZones(type: ZoneType) throws -> [Zone] {
        let content = try String(contentsOf: type.url, encoding: .utf8)
        
        return content.components(separatedBy: .newlines)
            .filter { line in
                !line.isEmpty && !line.hasPrefix("#") && line.contains("\t")
            }
            .compactMap { line in
                let fields = line.components(separatedBy: "\t")
                guard fields.count >= 4 else { return nil }
                return Zone(
                    identifier: fields[2],
                    description: fields[3].trimmingCharacters(in: .whitespaces),
                    type: type
                )
            }
    }
}
