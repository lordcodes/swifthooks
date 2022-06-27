// Copyright © 2022 Andrew Lord.

public enum SharedHooks {
    public static let configuration: Configuration = Configuration()
}

var printer: Printer {
    SharedHooks.configuration.printer
}
