// Copyright © 2022 Andrew Lord.

public protocol Printer {
    func printMessage(_ message: @autoclosure () -> String)
}

public struct ConsolePrinter: Printer {
    public init() {}
    
    public func printMessage(_ message: @autoclosure () -> String) {
        print(message())
    }
}
