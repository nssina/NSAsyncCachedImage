# NSAsyncCachedImage

[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-success.svg)](https://github.com/apple/swift-package-manager)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fnssina%2FNSAsyncCachedImage%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/nssina/NSAsyncCachedImage)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fnssina%2FNSAsyncCachedImage%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/nssina/NSAsyncCachedImage)

NSAsyncCachedImage is a lightweight package which provides the main thing that is missing from Apple [AsyncImage](https://developer.apple.com/documentation/swiftui/asyncimage) API, Caching!. This package will let you download and cache images asynchronously in SwiftUI views.

## Supported Platforms

NSAsyncCachedImage supports `iOS 13`, `macOS 10.15`, `tvOS 13` and `watchOS 6`.  

## Installation

NSAsyncCachedImage can be installed with the [Swift Package Manager](https://www.swift.org/package-manager/):

```
https://github.com/nssina/NSAsyncCachedImage.git
```

## Usage

```
import SwiftUI
import NSAsyncCachedImage

struct ContentView: View {
    var body: some View {
        VStack {
            NSAsyncCachedImage("https://example.com/icon.png") { image in
                image
                    .resizable()
            } placeHolder: {
                ProgressView()
            }
            .frame(width: 200, height: 200)
            .cornerRadius(12)
        }
        .padding()
    }
}
```

## License

The project is available under [MIT Licence](./LICENSE)
