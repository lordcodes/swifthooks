// Copyright © 2022 Andrew Lord.

import Files
import XCTest

@testable import SwiftHooksKit

class GitHooksDirectoryTests: XCTestCase {
    private var folder: Folder!

    override func setUpWithError() throws {
        folder = try Folder.home.createSubfolderIfNeeded(withName: ".swifthookskittests")
        try folder.empty()
    }

    override func tearDownWithError() throws {
        try folder.delete()
    }

    func test_gitHooks_noGitFolder() throws {
        XCTAssertThrowsError(try folder.gitHooks()) { error in
            if let hooksError = error as? SwiftHooksError {
                XCTAssertEqual(hooksError, SwiftHooksError.noGitDirectory)
            } else {
                XCTFail("Expected SwiftHooksError.noGitDirectory, but got \(error.localizedDescription)")
            }
        }
    }

    func test_gitHooks_gitFolderExistsCreatesHooks() throws {
        try folder.createSubfolder(named: ".git")

        let actual = try folder.gitHooks()

        let expected = try folder.subfolder(at: ".git/hooks")
        XCTAssertEqual(actual, expected)
    }

    func test_gitHooks_gitFolderAndHooksExist() throws {
        try folder.createSubfolder(at: ".git/hooks")

        let actual = try folder.gitHooks()

        let expected = try folder.subfolder(at: ".git/hooks")
        XCTAssertEqual(actual, expected)
    }

    func test_projectHooks() throws {
        let actual = try folder.projectHooks()

        let expected = try folder.subfolder(at: ".git-hooks")
        XCTAssertEqual(actual, expected)
    }
}
