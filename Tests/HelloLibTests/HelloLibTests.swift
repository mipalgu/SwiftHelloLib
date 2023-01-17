import XCTest
@testable import HelloLib

final class HelloLibTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(HelloLib().text, "Hello, World!")
    }
}
