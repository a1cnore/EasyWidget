import XCTest
@testable import EasyWidget

final class EasyWidgetTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(EasyWidget().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
