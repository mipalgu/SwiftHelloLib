import XCTest
@testable import HelloLib

/// Unit tests for the library.
final class HelloLibTests: XCTestCase {
    /// Test the content of the text.
    func testText() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(HelloLib().text, "Hello")
    }

    /// Execute the static `run()` method
    /// and check its output.
    func testRunMethod() throws {
        var fds: [CInt] = [0, 0]
        XCTAssertEqual(pipe(&fds), 0)
        XCTAssertEqual(dup2(fds[1], STDOUT_FILENO), STDOUT_FILENO)
        XCTAssertEqual(close(fds[1]), 0)
        HelloLib.run()
        close(STDOUT_FILENO)
        let fd = FileHandle(fileDescriptor: fds[0])
        let data = try fd.readToEnd()
        XCTAssertNotNil(data)
        guard let data else { return }
        XCTAssertEqual(data.count, 6)
        XCTAssertEqual(String(data: data, encoding: .utf8), "Hello\n")
        try fd.close()
    }
}
