// Copyright © 2022 Andrew Lord.

@testable import SharedHooksKit

class FakePrinter: Printer {
    var messagesPrinted = [String]()
    var forcedMessagesPrinted = [String]()
    var errorsPrinted = [SharedHooksError]()

    func printMessage(_ message: @autoclosure () -> String) {
        messagesPrinted.append(message())
    }

    func printForced(_ message: @autoclosure () -> String) {
        forcedMessagesPrinted.append(message())
    }

    func printError(_ error: SharedHooksError) {
        errorsPrinted.append(error)
    }
}
