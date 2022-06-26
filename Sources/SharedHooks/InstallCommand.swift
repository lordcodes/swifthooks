// Copyright © 2022 Andrew Lord.

import ArgumentParser
import SharedHooksKit

struct InstallCommand: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "install",
        abstract: "Install shared Git hooks"
    )

    func run() throws {
        InstallHooksService(printer: ConsolePrinter()).run()
    }
}
