// Copyright © 2022 Andrew Lord.

import Foundation

public protocol Printer {
    func printMessage(_ message: @autoclosure () -> String)

    func printForced(_ message: @autoclosure () -> String)

    func printError(_ error: SharedHooksError)
}

struct NoPrinter: Printer {
    func printMessage(_ message: @autoclosure () -> String) {}

    func printForced(_ message: @autoclosure () -> String) {}

    func printError(_ error: SharedHooksError) {}
}

public struct ConsolePrinter: Printer {
    private let quiet: Bool

    public init(quiet: Bool) {
        self.quiet = quiet
    }
    
    public func printMessage(_ message: @autoclosure () -> String) {
        if !quiet {
            print(message())
        }
    }

    public func printForced(_ message: @autoclosure () -> String) {
        print(message())
    }

    public func printError(_ error: SharedHooksError) {
        fputs("\(error.description)\n", stderr)
    }
}
