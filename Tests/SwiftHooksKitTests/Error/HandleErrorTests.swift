// Copyright © 2022 Andrew Lord.

import XCTest

@testable import SwiftHooksKit

class HandleErrorTests: XCTestCase {
    private let printer = FakePrinter()

    func test_handleFatalError_noError() throws {
        let actual = try handleFatalError(using: printer) { "Success" }

        XCTAssertEqual(actual, "Success")
        XCTAssertNil(printer.errorsPrinted.last)
    }

    func test_handleFatalError_SwiftHooksError() throws {
        XCTAssertThrowsError(
            try handleFatalError(using: printer) { throw SwiftHooksError.noGitDirectory }
        ) { error in
            XCTAssertEqual(error as! ExitCode, ExitCode.failure)
        }
        let printedError = printer.errorsPrinted.last
        XCTAssertNotNil(printedError)
        XCTAssertEqual(printedError, SwiftHooksError.noGitDirectory)
    }

    func test_handleFatalError_otherError() throws {
        XCTAssertThrowsError(
            try handleFatalError(using: printer) { throw TestError.failed }
        ) { error in
            XCTAssertEqual(error as! ExitCode, ExitCode.failure)
        }
        let printedError = printer.errorsPrinted.last
        XCTAssertNotNil(printedError)
        XCTAssertEqual(printedError, SwiftHooksError.otherError("Failed"))
    }

    func test_handleNonFatalError_noError() throws {
        handleNonFatalError(using: printer) { _ = 6 }

        XCTAssertNil(printer.errorsPrinted.last)
    }

    func test_handleNonFatalError_SwiftHooksError() throws {
        handleNonFatalError(using: printer) { throw SwiftHooksError.noGitDirectory }

        let printedError = printer.errorsPrinted.last
        XCTAssertNotNil(printedError)
        XCTAssertEqual(printedError, SwiftHooksError.noGitDirectory)
    }

    func test_handleNonFatalError_otherError() throws {
        handleNonFatalError(using: printer) { throw TestError.failed }

        let printedError = printer.errorsPrinted.last
        XCTAssertNotNil(printedError)
        XCTAssertEqual(printedError, SwiftHooksError.otherError("Failed"))
    }
}
