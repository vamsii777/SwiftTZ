import Foundation

extension TimeZone {
  /// Creates a TimeZone instance using a type-safe IANA timezone identifier
  /// - Parameter identifier: The IANA timezone identifier
  /// - Returns: A TimeZone instance for the specified identifier
  public init(_ identifier: TimeZoneIdentifier) {
    self = TimeZone(identifier: identifier.rawValue)!
  }

  /// Creates a TimeZone instance using a type-safe IANA timezone identifier
  /// - Parameter identifier: The IANA timezone identifier
  /// - Returns: A TimeZone instance for the specified identifier
  public init(identifier: TimeZoneIdentifier) {
    self = TimeZone(identifier: identifier.rawValue)!
  }

  /// Returns the identifier as a type-safe TimeZoneIdentifier
  public var timeZoneIdentifier: TimeZoneIdentifier {
    TimeZoneIdentifier(rawValue: identifier)!
  }
}