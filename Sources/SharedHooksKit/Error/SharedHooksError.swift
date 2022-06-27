// Copyright © 2022 Andrew Lord.

import Foundation

/// Error type thrown by SharedHooks' throwing APIs.
public enum SharedHooksError: Error {
    /// No .git directory was found.
    case noGitDirectory

    /// No project .git-hooks directory was found.
    case noProjectHooksDirectory

    /// Issue interacting with the hook file.
    case resovingHookFile(hook: String, reason: ResolvingHookFile)

    // Other errors that weren't explicitly handled by the framework.
    case otherError(Error)
}

extension SharedHooksError: CustomStringConvertible {
    public var description: String {
        """
        SharedHooks encountered an error.
        Reason: \(reason)
        """
    }

    private var reason: String {
        switch self {
        case .noGitDirectory:
            return "Couldn't find .git directory. Please make sure you are in the project root directory."
        case .noProjectHooksDirectory:
            return "Couldn't read or create the project .git-hooks directory."
        case let .resovingHookFile(hook, reason):
            return "For hook \(hook), \(reason.description)"
        case let .otherError(error):
            return error.localizedDescription
        }
    }
}

extension SharedHooksError {
    /// Different reasons interacting with the hook file failed.
    public enum ResolvingHookFile {
        /// Creating a new hook file failed.
        case creatingNew

        /// Deleting an existing hook file failed, either when uninstalling or re-installing.
        case deletingExisting

        /// Reading the contents of a hook file failed.
        case readExistingHookFileContents

        /// Renaming a non-SharedHooks hook file in order to back it up failed.
        case renamingBackup

        var description: String {
            switch self {
            case .creatingNew:
                return "Failed to create new hook file"
            case .deletingExisting:
                return "Failed to delete existing SharedHooks hook file"
            case .readExistingHookFileContents:
                return "Failed to read contents of existing hook file"
            case .renamingBackup:
                return "Failed to backup a non-SharedHooks hook file by renaming it"
            }
        }
    }
}
