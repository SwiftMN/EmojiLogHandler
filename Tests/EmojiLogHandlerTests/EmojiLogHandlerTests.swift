import XCTest
@testable import EmojiLogHandler

final class EmojiLogHandlerTests: XCTestCase {
  
  var handler: EmojiLogHandler!
  
  override func setUp() {
    handler = EmojiLogHandler("mn.swift.EmojiLogger")
  }
  
  func testInit() {
    XCTAssertEqual(handler.label, "mn.swift.EmojiLogger")
  }
  
  func testSimplifiedFileName() {
    XCTAssertEqual("SomeFile", EmojiLogHandler.simplifiedFileName("/some/dir/SomeFile.swift"))
    XCTAssertEqual("SomeFile", EmojiLogHandler.simplifiedFileName("/some/dir/SomeFile"))
    XCTAssertEqual("SomeFile", EmojiLogHandler.simplifiedFileName("SomeFile.swift"))
    XCTAssertEqual("SomeFile", EmojiLogHandler.simplifiedFileName("SomeFile"))
    XCTAssertEqual("", EmojiLogHandler.simplifiedFileName(""))
  }
  
  func testFormat() {
    XCTAssertEqual(
      "📋  [TRACE] [SomeFile:35] some message",
      EmojiLogHandler.format(.trace, "some message", nil, "/some/dir/SomeFile.swift", 35)
    )
    XCTAssertEqual(
      "🐛  [DEBUG] [SomeFile:35] some message",
      EmojiLogHandler.format(.debug, "some message", nil, "/some/dir/SomeFile.swift", 35)
    )
    XCTAssertEqual(
      "🗣  [INFO] [SomeFile:35] some message",
      EmojiLogHandler.format(.info, "some message", nil, "/some/dir/SomeFile.swift", 35)
    )
    XCTAssertEqual(
      "👀  [NOTICE] [SomeFile:35] some message",
      EmojiLogHandler.format(.notice, "some message", nil, "/some/dir/SomeFile.swift", 35)
    )
    XCTAssertEqual(
      "💥💥[WARN] [SomeFile:35] some message",
      EmojiLogHandler.format(.warning, "some message", nil, "/some/dir/SomeFile.swift", 35)
    )
    XCTAssertEqual(
      "💩💩[ERROR] [SomeFile:35] some message",
      EmojiLogHandler.format(.error, "some message", nil, "/some/dir/SomeFile.swift", 35)
    )
    XCTAssertEqual(
      "‼️‼️[CRITICAL] [SomeFile:35] some message",
      EmojiLogHandler.format(.critical, "some message", nil, "/some/dir/SomeFile.swift", 35)
    )
    XCTAssertEqual(
      "🤔  [HMMMMM] [SomeFile:35] some message",
      EmojiLogHandler.format(.trace, "some message", EmojiLogHandler.customPrefix("🤔  [HMMMMM]"), "/some/dir/SomeFile.swift", 35)
    )
  }
}

