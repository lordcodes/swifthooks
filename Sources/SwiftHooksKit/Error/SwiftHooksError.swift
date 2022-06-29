// Copyright © 2022 Andrew Lord.

import Foundation

/// Error type thrown by SwiftHooks' throwing APIs.
public enum SwiftHooksError: Error, Equatable {
    /// No .git directory was found.
    case noGitDirectory

    /// No project .git-hooks directory was found.
    case noProjectHooksDirectory

    /// Issue interacting with the hook file.
    case resovingHookFile(hook: String, reason: ResolvingHookFile)

    /// Issue setting read/write/execute permissions of hook file.
    case settingPermissionsOnHookFile(hook: String)

    /// Issue writing contents to hook file.
    case writingToHookFile(hook: String)

    // Other errors that weren't explicitly handled by the framework.
    case otherError(String)
}

extension SwiftHooksError: LocalizedError {
    public var errorDescription: String? {
        description
    }
}

extension SwiftHooksError: CustomStringConvertible {
    public var description: String {
        """
        SwiftHooks encountered an error.
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
            return "For hook \(hook), \(reason.description)."
        case let .settingPermissionsOnHookFile(hook):
            return "For hook \(hook), failed to set permissions of hook file."
        case let .writingToHookFile(hook):
            return "For hook \(hook), failed to write contents to hook file."
        case let .otherError(message):
            return "Other error, \(message)"
        }
    }
}

extension SwiftHooksError {
    /// Different reasons interacting with the hook file failed.
    public enum ResolvingHookFile: Equatable {
        /// Creating a new hook file failed.
        case creatingNew

        /// Deleting an existing hook file failed, either when uninstalling or re-installing.
        case deletingExisting

        /// Reading the contents of a hook file failed.
        case readExistingHookFileContents

        /// Renaming a non-SwiftHooks hook file in order to back it up failed.
        case renamingBackup

        var description: String {
            switch self {
            case .creatingNew:
                return "Failed to create new hook file"
            case .deletingExisting:
                return "Failed to delete existing SwiftHooks hook file"
            case .readExistingHookFileContents:
                return "Failed to read contents of existing hook file"
            case .renamingBackup:
                return "Failed to backup a non-SwiftHooks hook file by renaming it"
            }
        }
    }
}
