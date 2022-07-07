// Copyright © 2022 Andrew Lord.

/// Configuration of the SwiftHooksKit framework.
public class SwiftHooks {
    /// Shared SwiftHooks instance.
    public static let shared = SwiftHooks()

    /// Control outputting of messages and errors, by default does nothing.
    ///
    /// There is a `ConsolePrinter` to print to console for CLI tools.
    public var printer: Printer = NoPrinter()
}
