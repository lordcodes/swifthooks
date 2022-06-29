<p align="center">
    <img src="Art/logo.png" width="500" max-width="90%" alt="SwiftHooks" />
</p>

<p align="center">
    <img src="https://img.shields.io/badge/Swift-5.6-orange.svg" />
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/swiftpm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
     <a href="https://github.com/lordcodes/swifthooks/releases/latest">
         <img src="https://img.shields.io/github/release/lordcodes/swifthooks.svg?style=flat" alt="Latest release" />
     </a>
    <a href="https://twitter.com/lordcodes">
        <img src="https://img.shields.io/badge/twitter-@lordcodes-blue.svg?style=flat" alt="Twitter: @lordcodes" />
    </a>
</p>

---

This is **SwiftHooks** - a tool and Tuist plugin to install Git hooks that can be distributed alongside a project and shared by all the contributors.

&nbsp;

<p align="center">
    <a href="#features">Features</a> • <a href="#install">Install</a> • <a href="#usage">Usage</a> • <a href="#contributing-or-help">Contributing</a>
</p>

## Features

#### ☑️ Store Git hooks within a project

Provide Git hooks for all project contributors to share.

#### ☑️ Easily install into Git

Simply run a single command and a Git hook will be installed that runs your project-specific Git hooks.

#### ☑️ Easily uninstall

A command is provided to remove any installed hooks.

&nbsp;

## Install

The primary intention was to use SwiftHooks as a [Tuist](https://github.com/tuist/tuist) plugin, however, it can also be used as a standard CLI tool as well.

### ▶︎ Tuist Plugin

To set up as a Tuist plugin in your project simply follow the [Tuist plugin install instructions](https://docs.tuist.io/plugins/using-plugins/) using the [latest version](https://github.com/lordcodes/swifthooks/releases/latest).

Add the plugin to `Config.swift`.

```swift
import ProjectDescription

let config = Config(
    plugins: [
        .git(url: "https://github.com/lordcodes/swifthooks.git", tag: "{ENTER_LATEST_VERSION}")
    ]
)
```

### ▶︎ Standalone via Swift Package Manager

SwiftHooks can be easily installed globally using Swift Package Manager.

```terminal
 git clone https://github.com/lordcodes/swifthooks-swift
 cd swifthooks-swift
 make install
```

This will install swifthooks into `/usr/local/bin`. If you get a permission error it may be that you don't have permission to write there in which case you just need to adjust permissions using `sudo chown -R $(whoami) /usr/local/bin`.

You can uninstall it again using `make uninstall` which simply deletes it from `/usr/local/bin`.

#### ▶︎ Homebrew

Support for Homebrew may be planned in the future.

&nbsp;

## Usage

### Tuist Plugin

Ensure you have fetched with `tuist fetch` and you will then be able to run the plugin's tasks.

```terminal
USAGE: tuist hooks <install|uninstall|version> [-q|--quiet]

ARGUMENTS:
  <install>               Installs Git hooks that run's hooks stored in project.
  <uninstall>             Uninstalls Git hooks that were installed.
  <version>               Prints out the current version of the tool.

OPTIONS:
  -q, --quiet             Silence any output except errors 
```

### Standalone CLI

```terminal
USAGE: swifthooks <install|uninstall|version> [-q|--quiet]

ARGUMENTS:
  <install>               Installs Git hooks that run's hooks stored in project.
  <uninstall>             Uninstalls Git hooks that were installed.
  <version>               Prints out the current version of the tool.

OPTIONS:
  -q, --quiet             Silence any output except errors 
```

## Contributing or Help

If you notice any bugs or have a new feature to suggest, please check out the [contributing guide](https://github.com/lordcodes/swifthooks/blob/master/CONTRIBUTING.md). If you want to make changes, please make sure to discuss anything big before putting in the effort of creating the PR.

To reach out, please contact [@lordcodes on Twitter](https://twitter.com/lordcodes).
