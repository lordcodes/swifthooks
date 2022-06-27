// Copyright © 2022 Andrew Lord.

import Files

extension Folder {
    func gitHooks() throws -> Folder {
        let gitDirectory = try git()
        return try gitDirectory.createSubfolderIfNeeded(at: "hooks")
    }

    private func git() throws -> Folder {
        do {
            return try subfolder(named: ".git")
        } catch is LocationError {
            throw SharedHooksError.noGitDirectory
        }
    }

    func projectHooks() throws -> Folder {
        do {
            return try createSubfolderIfNeeded(at: ".git-hooks")
        } catch is WriteError {
            throw SharedHooksError.noProjectHooksDirectory
        }
    }
}
