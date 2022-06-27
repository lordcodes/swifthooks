// Copyright © 2022 Andrew Lord.

/// Globals for the SharedHooksKit framework.
public enum SharedHooks {
    /// Access configuration for the framework.
    public static let configuration: Configuration = Configuration()
}

var printer: Printer {
    SharedHooks.configuration.printer
}
