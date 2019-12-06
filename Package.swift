// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "EmojiLogHandler",
  products: [
    .library(
      name: "EmojiLogHandler",
      targets: ["EmojiLogHandler"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-log.git", from: "1.2.0")
  ],
  targets: [
    .target(
      name: "EmojiLogHandler",
      dependencies: ["Logging"]),
    .testTarget(
      name: "EmojiLogHandlerTests",
      dependencies: ["EmojiLogHandler"]),
  ]
)
