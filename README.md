# NSAsyncCachedImage

NSAsyncCachedImage is a lightweight package which provides the main thing that is missing from Apple [AsyncImage](https://developer.apple.com/documentation/swiftui/asyncimage) API, Caching!. NSAsyncCachedImage let you load and cache images asynchronously in SwiftUI views. Also it's available from iOS 13.

![Swift 5.7](https://img.shields.io/badge/Swift-5.7-orange.svg)
![Platforms](https://img.shields.io/badge/Xcode-14-orange.svg?style=flat)
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-success.svg)](https://github.com/apple/swift-package-manager)

## Supported Platforms

You can use `NSAsyncCachedImage` in the following platforms:

* iOS 13.0+
* tvOS 13.0+
* macOS 10.15+
* watchOS 6.0+

## Installation

#### [Swift Package Manager](https://www.swift.org/package-manager/)

``` swift
// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "YourProject",
  dependencies: [
    .package(url: "https://github.com/nssina/NSAsyncCachedImage.git", from: "1.0.0")
  ],
  targets: [
    .target(name: "YourProject", dependencies: ["NSAsyncCachedImage"])
  ]
)
```

