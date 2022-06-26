// Copyright © 2022 Andrew Lord.

import ArgumentParser

struct MainCommand: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "hooks",
        abstract: "",
        subcommands: [InstallCommand.self, UninstallCommand.self, VersionCommand.self]
    )
}
