// Copyright © 2022 Andrew Lord.

import ArgumentParser
import SharedHooksKit

struct UninstallCommand: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "uninstall",
        abstract: "Uninstall shared Git hooks"
    )

    @Flag(name: .shortAndLong, help: "Silence any output except errors")
    var quiet: Bool = false

    func run() throws {
        let printer = ConsolePrinter(quiet: quiet)
        UninstallHooksService(printer: printer)
            .run()
    }
}
