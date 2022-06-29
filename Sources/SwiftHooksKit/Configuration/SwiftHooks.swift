// Copyright © 2022 Andrew Lord.

/// Globals for the SwiftHooksKit framework.
public enum SwiftHooks {
    /// Access configuration for the framework.
    public static let configuration: Configuration = Configuration()
}

var printer: Printer {
    SwiftHooks.configuration.printer
}
