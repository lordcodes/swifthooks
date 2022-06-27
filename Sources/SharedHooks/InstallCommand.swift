// Copyright © 2022 Andrew Lord.

import ArgumentParser
import SharedHooksKit

struct InstallCommand: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "install",
        abstract: "Install shared Git hooks"
    )

    @Flag(name: .shortAndLong, help: "Silence any output except errors")
    var quiet: Bool = false

    func run() throws {
        SharedHooks.configuration.printer = ConsolePrinter(quiet: quiet)
        InstallHooksService()
            .run()
    }
}
