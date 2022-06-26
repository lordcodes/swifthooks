// Copyright © 2022 Andrew Lord.

public struct UninstallHooksService {
    private let printer: Printer

    public init(printer: Printer) {
        self.printer = printer
    }

    public func run() {
        printer.printMessage("🗑 Uninstalling git hooks")
    }
}
