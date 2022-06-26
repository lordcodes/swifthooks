// Copyright © 2022 Andrew Lord.

public struct VersionService {
    private let printer: Printer

    public init(printer: Printer) {
        self.printer = printer
    }

    public func run() {
        printer.printMessage(Version.current)
    }
}
