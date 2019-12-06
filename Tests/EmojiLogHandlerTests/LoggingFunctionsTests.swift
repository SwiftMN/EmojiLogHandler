import XCTest
@testable import Logging
@testable import EmojiLogHandler

class TestLogHandler: LogHandler {

  init(_ label: String = "test.handler") {
  }
  
  var level: Logger.Level? = nil
  var message: Logger.Message? = nil
  var file: String? = nil
  var function: String? = nil
  var line: UInt? = nil

  func log(
    level: Logger.Level,
    message: Logger.Message,
    metadata: Logger.Metadata?,
    file: String,
    function: String,
    line: UInt
  ) {
    self.level = level
    self.message = message
    self.file = file
    self.function = function
    self.line = line
  }
  
  var metadata = Logger.Metadata()
  var logLevel: Logger.Level = .trace
  subscript(metadataKey key: String) -> Logger.Metadata.Value? {
    get {
      return metadata[key]
    }
    set(newValue) {
      metadata[key] = newValue
    }
  }
}

final class LoggingFunctionsTests: XCTestCase {

  var testHandler: TestLogHandler!
  
  override func setUp() {
    testHandler = TestLogHandler()
    logger = Logger(label: "test.logger")
    logger.handler = testHandler
  }
  
  func testTrace() {
    📋("test")
    XCTAssertEqual(.trace, testHandler.level)
    XCTAssertEqual("test", testHandler.message)
    XCTAssertEqual(#file, testHandler.file)
    XCTAssertEqual(#function, testHandler.function)
    XCTAssertEqual(#line - 5, testHandler.line)
  }
  
  func testDebug() {
    🐛("test")
    XCTAssertEqual(.debug, testHandler.level)
    XCTAssertEqual("test", testHandler.message)
    XCTAssertEqual(#file, testHandler.file)
    XCTAssertEqual(#function, testHandler.function)
    XCTAssertEqual(#line - 5, testHandler.line)
  }
  
  func testInfo() {
    🗣("test")
    XCTAssertEqual(.info, testHandler.level)
    XCTAssertEqual("test", testHandler.message)
    XCTAssertEqual(#file, testHandler.file)
    XCTAssertEqual(#function, testHandler.function)
    XCTAssertEqual(#line - 5, testHandler.line)
  }
  
  func testNotice() {
    👀("test")
    XCTAssertEqual(.notice, testHandler.level)
    XCTAssertEqual("test", testHandler.message)
    XCTAssertEqual(#file, testHandler.file)
    XCTAssertEqual(#function, testHandler.function)
    XCTAssertEqual(#line - 5, testHandler.line)
  }
  
  func testWarning() {
    💥("test")
    XCTAssertEqual(.warning, testHandler.level)
    XCTAssertEqual("test", testHandler.message)
    XCTAssertEqual(#file, testHandler.file)
    XCTAssertEqual(#function, testHandler.function)
    XCTAssertEqual(#line - 5, testHandler.line)
  }
  
  func testError() {
    💩("test")
    XCTAssertEqual(.error, testHandler.level)
    XCTAssertEqual("test", testHandler.message)
    XCTAssertEqual(#file, testHandler.file)
    XCTAssertEqual(#function, testHandler.function)
    XCTAssertEqual(#line - 5, testHandler.line)
  }
  
  func testCritical() {
    ！("test")
    XCTAssertEqual(.critical, testHandler.level)
    XCTAssertEqual("test", testHandler.message)
    XCTAssertEqual(#file, testHandler.file)
    XCTAssertEqual(#function, testHandler.function)
    XCTAssertEqual(#line - 5, testHandler.line)
  }
  
}
