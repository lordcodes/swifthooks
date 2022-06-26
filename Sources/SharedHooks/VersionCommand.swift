// Copyright © 2022 Andrew Lord.

import ArgumentParser
import SharedHooksKit

struct VersionCommand: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "version",
        abstract: "Print version"
    )

    func run() throws {
        VersionService(printer: ConsolePrinter()).run()
    }
}