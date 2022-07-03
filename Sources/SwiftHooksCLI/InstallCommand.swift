// Copyright © 2022 Andrew Lord.

import SwiftHooksKit

struct InstallCommand {
    let programName: String
    let option: String?

    func run() {
        switch option {
        case .none:
            performInstall(isQuiet: false)
        case .some("-q"), .some("--quiet"):
            performInstall(isQuiet: true)
        case .some("-h"), .some("--help"):
            printHelp()
        case let .some(other):
            printUnexpectedOptionError(option: other)
        }
    }

    private func performInstall(isQuiet: Bool) {
        SwiftHooks.configuration.printer = ConsolePrinter(quiet: isQuiet)
        runCommand {
            try InstallHooksService().run()
        }
    }

    private func printUnexpectedOptionError(option: String) {
        print("Error: Unknown option '\(option)'\n")
        printHelp()
    }

    private func printHelp() {
        let help = """
        OVERVIEW: Install shared Git hooks

        USAGE: \(programName) install [--quiet]

        OPTIONS:
          -q, --quiet             Silence any output except errors
          -h, --help              Show help information.
        
        """
        print(help)
    }
}
