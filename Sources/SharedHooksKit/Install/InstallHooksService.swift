// Copyright © 2022 Andrew Lord.

public struct InstallHooksService {
    private let printer: Printer

    public init(printer: Printer) {
        self.printer = printer
    }

    public func run() {
        printer.printMessage("🔨 Installing project Git hooks")
    }
}
