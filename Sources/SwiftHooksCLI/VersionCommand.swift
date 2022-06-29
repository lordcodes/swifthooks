// Copyright © 2022 Andrew Lord.

import ArgumentParser
import SwiftHooksKit

struct VersionCommand: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "version",
        abstract: "Print version"
    )

    func run() throws {
        SwiftHooks.configuration.printer = ConsolePrinter(quiet: false)
        VersionService()
            .run()
    }
}
