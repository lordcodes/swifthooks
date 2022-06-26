// Copyright © 2022 Andrew Lord.

public protocol Printer {
    func printMessage(_ message: @autoclosure () -> String)
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

    public func printError(_ message: @autoclosure () -> String) {
        print(message())
    }
}
