// Copyright © 2022 Andrew Lord.

import XCTest

@testable import SwiftHooksKit

class VersionServiceTests: XCTestCase {
    private let printer = FakePrinter()

    private let service = VersionService()

    override func setUpWithError() throws {
        SwiftHooks.configuration.printer = printer
    }

    override func tearDownWithError() throws {
        SwiftHooks.configuration.printer = NoPrinter()
    }

    func test_run() throws {
        service.run()

        XCTAssertEqual(printer.forcedMessagesPrinted.last, Version.current)
    }
}
