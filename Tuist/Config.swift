import ProjectDescription

let config = Config(
    compatibleXcodeVersions: .upToNextMinor("13.4"),
    plugins: [
        .git(url: "https://github.com/lordcodes/tuist-plugin-swiftformat", tag: "0.1.0"),
    ]
)
