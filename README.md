# SwiftTZ

A type-safe Swift wrapper for IANA timezone identifiers and an extension for Foundation `TimeZone` identifiers.

- Type-safe IANA timezone identifiers
- Auto-generated from the latest IANA Time Zone Database
- Seamless integration with Foundation.TimeZone
- Support for all major Apple platforms (iOS, macOS, watchOS, tvOS, visionOS)

## Getting Started

Add SwiftTZ to your `Package.swift` file:

```swift
dependencies: [
  .package(url: "https://github.com/vamsii777/SwiftTZ.git", from: "0.2.0")
]
```

## Usage

To use a timezone, create a `TimeZone` instance using a `TimeZoneIdentifier`:

```swift
import SwiftTZ

let newYork = TimeZone(.americaNewYork)
print(newYork.identifier) // "America/New_York"
```

## TimeZone Initialization

The `TimeZone` initializer that takes a `TimeZoneIdentifier` will never fail because the set of identifiers is statically known and known to be valid.  

```swift
let newYork = TimeZone(.americaNewYork)
print(newYork.identifier) // "America/New_York"
```

```swift 
let tokyo = TimeZone(identifier: .asiaTokyo)
print(tokyo.identifier) // "Asia/Tokyo"
``` 

```swift
let london = TimeZone(.europeLondon)  // "Europe/London"
let identifier = london.timeZoneIdentifier
print(identifier) // "europeLondon"
```

## Package Structure

- `Sources/SwiftTZ`: The main library
- `Sources/SwiftTZGenerator`: The generator executable that fetches the latest IANA Time Zone Database
- `Tests/SwiftTZTests`: Unit tests  

## Contributing

Contributions are welcome! If you encounter a bug or have a feature request, feel free to open an issue or submit a pull request.

### Setting Up

1. Clone the repository
```sh
git clone https://github.com/vamsi777/SwiftTZ.git
cd SwiftTZ
```

2. Run the generator to fetch the latest IANA Time Zone Database and generate the `TimeZoneIdentifier.swift` file

```sh
swift run SwiftTZGenerator
``` 

## Acknowledgments

- [IANA Time Zone Database](https://www.iana.org/time-zones)
- [PklSwift](https://github.com/apple/pkl-swift)
- [eggert/tz](https://github.com/eggert/tz)

## License

SwiftTZ is licensed under the MIT license. See the [LICENSE](LICENSE) file for details.

