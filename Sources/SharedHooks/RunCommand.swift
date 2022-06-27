// Copyright © 2022 Andrew Lord.

import ArgumentParser
import SharedHooksKit

extension ParsableCommand {
    func runCommand(runCommand: () throws -> Void) throws {
        do {
            try runCommand()
        } catch ExecutionError.failure {
            throw ExitCode.failure
        }
    }
}
