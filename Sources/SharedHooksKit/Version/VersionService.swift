// Copyright © 2022 Andrew Lord.

public struct VersionService {
    public init() {}

    public func run() {
        printer.printForced(Version.current)
    }
}
