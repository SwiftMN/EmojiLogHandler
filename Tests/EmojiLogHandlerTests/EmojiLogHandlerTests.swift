import XCTest
@testable import EmojiLogHandler

final class EmojiLogHandlerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(EmojiLogHandler().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
