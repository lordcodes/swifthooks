// Copyright © 2022 Andrew Lord.

import ArgumentParser
import SharedHooksKit

struct UninstallCommand: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "uninstall",
        abstract: "Uninstall shared Git hooks"
    )

    func run() throws {
        UninstallHooksService(printer: ConsolePrinter()).run()
    }
}
