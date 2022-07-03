// Copyright © 2022 Andrew Lord.

import Darwin
import Foundation

struct MainCommand {
    func run() {
        let programName = extractProgramName()
        let (subcommand, option) = extractSubcommand(programName: programName)
        switch subcommand {
        case "install":
            InstallCommand(programName: programName, option: option).run()
        case "uninstall":
            UninstallCommand(programName: programName, option: option).run()
        case "version":
            VersionCommand(programName: programName, option: option).run()
        case "-h", "--help":
            printHelp(programName: programName)
        default:
            printUnexpectedArgumentError(programName: programName, argument: subcommand)
        }
    }

    private func extractProgramName() -> String {
        guard let program = CommandLine.arguments.first else {
            exit(EXIT_SUCCESS)
        }
        var programName = URL(fileURLWithPath: program).lastPathComponent
        if programName == "tuist-hooks" {
            programName = "tuist hooks"
        }
        return programName
    }

    private func extractSubcommand(programName: String) -> (subcommand: String, option: String?) {
        let arguments = Array(CommandLine.arguments.dropFirst())
        guard arguments.count > 0 else {
            printHelp(programName: programName)
            exit(EXIT_SUCCESS)
        }
        guard arguments.count <= 2, let command = arguments.first else {
            printHelp(programName: programName)
            exit(EXIT_FAILURE)
        }
        if arguments.count == 1 {
            return (subcommand: command, option: nil)
        }
        return (subcommand: command, option: arguments.last)
    }

    private func printUnexpectedArgumentError(programName: String, argument: String) {
        print("Error: Unknown argument '\(argument)'\n")
        printHelp(programName: programName)
    }

    private func printHelp(programName: String) {
        let help = """
        USAGE: \(programName) <subcommand>

        OPTIONS:
          -h, --help              Show help information.

        SUBCOMMANDS:
          install                 Install shared Git hooks
          uninstall               Uninstall shared Git hooks
          version                 Print version

        See '\(programName) <subcommand> --help' for detailed help.

        """
        print(help)
    }
}
