// Copyright © 2022 Andrew Lord.

import Files

/// Service to uninstall project git hooks from .git.
/// Deletes SharedHooks hook files and then restores backed-up non-SharedHooks hook files if any exist.
public struct UninstallHooksService {
    /// Create the service.
    public init() {}

#warning("Add tests")
    /// Entry-point to run the service.
    /// - throws: `ExecutionError` when a fatal error has occurred and the command should fail.
    public func run() throws {
        printer.printMessage("🗑 Uninstalling git hooks")

        try uninstallGitHooks()
    }

    private func uninstallGitHooks() throws {
        let gitHooksDirectory = try handleFatalError {
            try Folder.current.gitHooks()
        }

        for hook in gitHooks {
            handleNonFatalError {
                try gitHooksDirectory.uninstall(hook: hook)
            }
        }
    }
}

private extension Folder {
    func uninstall(hook: String) throws {
        guard let hookFile = try? file(named: hook) else {
            return
        }
        let hookContents = try readHookFileContents(hook: hook, file: hookFile)
        if hookContents.contains(autoGeneratedIdentifier) {
            try deleteExistingHookFile(hook: hook, file: hookFile)
        }
        if let backup = try? file(named: "\(hook).backup") {
            try? backup.rename(to: hook)
        }
    }

    func readHookFileContents(hook: String, file: File) throws -> String {
        do {
            return try file.readAsString()
        } catch is ReadError {
            throw SharedHooksError.resovingHookFile(hook: hook, reason: .readExistingHookFileContents)
        }
    }

    func deleteExistingHookFile(hook: String, file: File) throws {
        do {
            try file.delete()
        } catch is LocationError {
            throw SharedHooksError.resovingHookFile(hook: hook, reason: .deletingExisting)
        }
    }
}
