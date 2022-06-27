// Copyright © 2022 Andrew Lord.

import ArgumentParser
import Files

extension Folder {
    func gitHooks() throws -> Folder {
        let gitDirectory = try git()
        return try gitDirectory.createSubfolderIfNeeded(at: "hooks")
    }

    private func git() throws -> Folder {
        do {
            return try Folder(path: ".git")
        } catch is LocationError {
            print("Error: Couldn't find .git directory. Please make sure you are in the project root directory.")
            throw ExitCode.failure
        }
    }
}
