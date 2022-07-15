# Contributing to SwiftHooks

If this is your first time contributing to SwiftHooks, please have a read through our [Code of Conduct](https://github.com/lordcodes/swifthooks/blob/master/CODE_OF_CONDUCT.md).

## Reporting a bug

* Compare the version you have installed with `tuist hooks version` and check it against [the latest version](https://github.com/lordcodes/swifthooks/releases).
* Check the issue hasn't [already been reported](https://github.com/lordcodes/swifthooks/issues).
* Check there isn't already an [open pull request](https://github.com/lordcodes/swifthooks/pulls) to fix the issue.
* [Open an issue](https://github.com/lordcodes/swifthooks/issues/new/choose) providing as much information as possible.
* If possible, fix the bug and provide a [new pull request](https://github.com/lordcodes/swifthooks/pulls).

## Suggesting a new feature

* Check the feature hasn't [already been requested](https://github.com/lordcodes/swifthooks/issues).
* Check there isn't already an [open pull request](https://github.com/lordcodes/swifthooks/pulls) implementing a similar idea.
* [Open an issue](https://github.com/lordcodes/swifthooks/issues/new/choose) providing a detailed description of the new feature, why you think it is needed and how it will be useful to other users.
* If it makes sense for the feature to be added, [a pull request](https://github.com/lordcodes/swifthooks/compare) adding the feature would be very much appreciated.

## Developing

* Ensure you have the latest version of Swift installed, the easiest way is via Xcode.
* Clone the repository.
* To build: build in Xcode or run `tuist plugin build`.
* To test: test in Xcode or run `tuist plugin test`.
* To format code: `tuist swiftformat`.
* To run locally, navigate to the project you want to run on and then run `tuist plugin run tuist-hooks {COMMAND} --path /path/to/swifthooks`.

Thanks!
