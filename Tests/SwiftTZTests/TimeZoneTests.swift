import Foundation
import Testing

@testable import SwiftTZ

struct TimeZoneTests {
  @Test func timeZoneCreation() {
    // Test valid timezone creation
    #expect(throws: Never.self) { TimeZone(identifier: .americaNew_York) }
    #expect(throws: Never.self) { TimeZone(.europeLondon) }
    #expect(throws: Never.self) { TimeZone(.asiaTokyo) }

    // Test timezone properties
    let nyTz = TimeZone(.americaNew_York)
    #expect(nyTz.timeZoneIdentifier == .americaNew_York)
    #expect(nyTz.identifier == "America/New_York")
  }

  @Test func commonTimeZones() {
    // Test some commonly used timezones
    let timezones: [TimeZoneIdentifier] = [
      .europeLondon,  // UTC+0/+1
      .americaNew_York,  // UTC-5/-4
      .asiaTokyo,  // UTC+9
      .australiaSydney,  // UTC+10/+11
      .pacificHonolulu,  // UTC-10
    ]

    for id in timezones {
      let tz = TimeZone(id)
      #expect(tz.timeZoneIdentifier == id)
    }
  }

  @Test func timeZoneRoundTrip() {
    // Test that converting from Foundation.TimeZone to our identifier and back works
    let originalTz = TimeZone(.americaNew_York)
    let identifier = originalTz.timeZoneIdentifier
    let roundTripTz = TimeZone(identifier)

    #expect(originalTz == roundTripTz)
  }

  @Test func allTimeZones() {
    // Test that all generated timezone identifiers are valid
    for id in TimeZoneIdentifier.allCases {
      #expect(throws: Never.self) { TimeZone(id) }
      let tz = TimeZone(id)
      #expect(tz.timeZoneIdentifier == id)
    }
  }

  @Test func timeZoneOffsets() {
    // Test timezone offset calculations
    let nyTz = TimeZone(.americaNew_York)
    let tokyoTz = TimeZone(.asiaTokyo)

    // Create dates using Calendar to ensure proper date creation
    let calendar = Calendar(identifier: .gregorian)

    // Create a date in winter (no DST)
    let winterDate = try! #require(
      calendar.date(
        from: DateComponents(
          calendar: calendar,
          year: 2024,
          month: 1,
          day: 1,
          hour: 12  // Specify noon to avoid any date boundary issues
        )))

    // Create a date in summer (DST where applicable)
    let summerDate = try! #require(
      calendar.date(
        from: DateComponents(
          calendar: calendar,
          year: 2024,
          month: 7,
          day: 1,
          hour: 12  // Specify noon to avoid any date boundary issues
        )))

    // Test New York offsets (EST/EDT)
    #expect(nyTz.secondsFromGMT(for: winterDate) == -5 * 3600)  // EST
    #expect(nyTz.secondsFromGMT(for: summerDate) == -4 * 3600)  // EDT

    // Test Tokyo offsets (JST - no DST)
    #expect(tokyoTz.secondsFromGMT(for: winterDate) == 9 * 3600)  // JST
    #expect(tokyoTz.secondsFromGMT(for: summerDate) == 9 * 3600)  // JST
  }

  @Test func invalidTimeZones() {
    // Test that invalid raw values don't create timezones
    #expect(TimeZoneIdentifier(rawValue: "Invalid/TimeZone") == nil)
    #expect(TimeZoneIdentifier(rawValue: "") == nil)
    #expect(TimeZoneIdentifier(rawValue: "GMT+25") == nil)  // Invalid offset
  }
}
