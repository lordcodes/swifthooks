// Copyright © 2022 Andrew Lord.

import SwiftHooksKit

struct VersionCommand {
    let options: [String]

    func run() {
        if options.contains(where: { $0 == "-h" || $0 == "--help" }) {
            printHelp()
            return
        }
        SwiftHooks.shared.printer = ConsolePrinter(quiet: false)
        VersionService().run()
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
