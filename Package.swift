// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
        name: "DeviceInterfaceDetector",
        platforms: [
            .iOS("17.2"),
            .macOS("14.2")
        ],
        products: [
            .library(
                    name: "DeviceInterfaceDetector",
                    targets: ["DeviceInterfaceDetector"]),
        ],
        targets: [
            .target(
                    name: "DeviceInterfaceDetector",
                    dependencies: []),
        ]
)
