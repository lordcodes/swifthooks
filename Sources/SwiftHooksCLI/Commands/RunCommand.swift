// Copyright © 2022 Andrew Lord.

import Darwin
import SwiftHooksKit

func runCommand(runCommand: () throws -> Void) {
    do {
        try runCommand()
    } catch ExitCode.failure {
        exit(EXIT_FAILURE)
    } catch {
        print(error)
        exit(EXIT_FAILURE)
    }
}
