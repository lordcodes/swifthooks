// Copyright © 2022 Andrew Lord.

import XCTest

@testable import SharedHooksKit

class HandleErrorTests: XCTestCase {
    private let printer = FakePrinter()

    override func setUpWithError() throws {
        SharedHooks.configuration.printer = printer
    }

    override func tearDownWithError() throws {
        SharedHooks.configuration.printer = NoPrinter()
    }

    func test_handleFatalError_noError() throws {
        let actual = try handleFatalError { "Success" }

        XCTAssertEqual(actual, "Success")
        XCTAssertNil(printer.errorsPrinted.last)
    }

    func test_handleFatalError_sharedHooksError() throws {
        XCTAssertThrowsError(
            try handleFatalError { throw SharedHooksError.noGitDirectory }
        ) { error in
            XCTAssertEqual(error as! ExecutionError, ExecutionError.failure)
        }
        let printedError = printer.errorsPrinted.last
        XCTAssertNotNil(printedError)
        XCTAssertEqual(printedError, SharedHooksError.noGitDirectory)
    }

    func test_handleFatalError_otherError() throws {
        XCTAssertThrowsError(
            try handleFatalError { throw TestError.failed }
        ) { error in
            XCTAssertEqual(error as! ExecutionError, ExecutionError.failure)
        }
        let printedError = printer.errorsPrinted.last
        XCTAssertNotNil(printedError)
        XCTAssertEqual(printedError, SharedHooksError.otherError("Failed"))
    }

    func test_handleNonFatalError_noError() throws {
        handleNonFatalError { let _ = 6 }

        XCTAssertNil(printer.errorsPrinted.last)
    }

    func test_handleNonFatalError_sharedHooksError() throws {
        handleNonFatalError { throw SharedHooksError.noGitDirectory }

        let printedError = printer.errorsPrinted.last
        XCTAssertNotNil(printedError)
        XCTAssertEqual(printedError, SharedHooksError.noGitDirectory)
    }

    func test_handleNonFatalError_otherError() throws {
        handleNonFatalError { throw TestError.failed }

        let printedError = printer.errorsPrinted.last
        XCTAssertNotNil(printedError)
        XCTAssertEqual(printedError, SharedHooksError.otherError("Failed"))
    }
}
