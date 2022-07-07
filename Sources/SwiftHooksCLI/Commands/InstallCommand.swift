// Copyright © 2022 Andrew Lord.

import SwiftHooksKit

struct InstallCommand {
    let options: [String]

    func run() throws {
        if options.contains(where: { $0 == "-h" || $0 == "--help" }) {
            printHelp()
            return
        }
        let isQuiet = options.contains { $0 == "-q" || $0 == "--quiet" }
        SwiftHooks.shared.printer = ConsolePrinter(quiet: isQuiet)
        try InstallHooksService().run()
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
