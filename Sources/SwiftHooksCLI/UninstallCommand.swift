// Copyright © 2022 Andrew Lord.

import SwiftHooksKit

struct UninstallCommand {
    let programName: String
    let option: String?

    func run() {
        switch option {
        case .none:
            performUninstall(isQuiet: false)
        case .some("-q"), .some("--quiet"):
            performUninstall(isQuiet: true)
        case .some("-h"), .some("--help"):
            printHelp()
        case let .some(other):
            printUnexpectedOptionError(option: other)
        }
    }

    private func performUninstall(isQuiet: Bool) {
        SwiftHooks.configuration.printer = ConsolePrinter(quiet: isQuiet)
        runCommand {
            try UninstallHooksService().run()
        }
    }

    private func printUnexpectedOptionError(option: String) {
        print("Error: Unknown option '\(option)'\n")
        printHelp()
    }

    private func printHelp() {
        let help = """
        OVERVIEW: Uninstall shared Git hooks

        USAGE: \(programName) uninstall [--quiet]

        OPTIONS:
          -q, --quiet             Silence any output except errors
          -h, --help              Show help information.
        
        """
        print(help)
    }
}
