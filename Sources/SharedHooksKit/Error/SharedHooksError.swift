// Copyright © 2022 Andrew Lord.

import Foundation

public enum SharedHooksError: Error {
    case noGitDirectory
    case noProjectHooksDirectory
    case resovingHookFile(hook: String, reason: ResolvingHookFile)
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
    public enum ResolvingHookFile {
        case creatingNew
        case deletingExisting
        case readExistingHookFileContents
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
