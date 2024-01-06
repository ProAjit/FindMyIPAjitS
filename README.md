# FindMyIPAjitS

FindMyIPAjitS is a Swift library that provides functionality for fetching information about the user's IP address using the ipapi.co API.

## Features

- Retrieve detailed information about the user's IP address, including location, country, and more.
- Easy integration into Swift projects using the provided `FindMyIPViewModel` and `Service` classes.

## Installation

### Swift Package Manager

You can use the Swift Package Manager to install FindMyIPAjitS. Add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/FindMyIPAjitS.git", from: "1.0.0"),
],
targets: [
    .target(name: "YourTargetName", dependencies: ["FindMyIPAjitS"]),
]
