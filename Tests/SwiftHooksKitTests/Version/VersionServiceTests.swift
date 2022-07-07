// Copyright © 2022 Andrew Lord.

import XCTest

@testable import SwiftHooksKit

class VersionServiceTests: XCTestCase {
    private let printer = FakePrinter()

    private lazy var service = VersionService()

    override func setUp() {
        super.setUp()

        SwiftHooks.shared.printer = printer
    }

    override func tearDown() {
        SwiftHooks.shared.printer = NoPrinter()

        super.tearDown()
    }

    func test_run() throws {
        service.run()

        XCTAssertEqual(printer.forcedMessagesPrinted.last, Version.current)
    }
}
