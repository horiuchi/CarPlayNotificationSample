// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let packageName = "CarPlayNotificationSample"

let package = Package(
    name: packageName,
    defaultLocalization: "ja",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(name: packageName, targets: [packageName]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: packageName, dependencies: [], path: packageName),
    ]
)

