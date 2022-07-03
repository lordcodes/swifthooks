// Copyright © 2022 Andrew Lord.

import SwiftHooksKit

struct VersionCommand {
    let programName: String
    let option: String?

    func run() {
        switch option {
        case .none:
            performVersion()
        case .some("-h"), .some("--help"):
            printHelp()
        case let .some(other):
            printUnexpectedOptionError(option: other)
        }
    }

    private func performVersion() {
        SwiftHooks.configuration.printer = ConsolePrinter(quiet: false)
        VersionService().run()
    }

    private func printUnexpectedOptionError(option: String) {
        print("Error: Unknown option '\(option)'\n")
        printHelp()
    }

    private func printHelp() {
        let help = """
        OVERVIEW: Print version

        USAGE: \(programName) version

        OPTIONS:
          -h, --help              Show help information.
        
        """
        print(help)
    }
}
