import ProjectDescription

let config = Config(
    compatibleXcodeVersions: .upToNextMinor("13.4"),
    plugins: [
        .git(url: "https://github.com/lordcodes/swiftformat-tuist", tag: "v0.3.0"),
    ]
)
