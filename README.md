[![Build Status](https://travis-ci.com/MusicalPatterns/cli.svg?branch=master)](https://travis-ci.com/MusicalPatterns/cli)

# Musical Patterns - CLI

The Musical Patterns CLI provides all the commands and common configuration necessary to develop on a Musical Patterns repo.

When you install it as an `npm` package, `@musical-patterns/cli` copies its configuration files up into your repo's.

These configuration files are for building, testing, linting, publishing, storing, and sharing the code:

- .gitattributes
- .gitignore
- .npmignore
- .travis.yml
- LICENSE
- Makefile
- test/tslint.json
- test/mockDom.ts
- test/reporter.ts
- test/jasmine.js
- tsconfig-common.json
- tsconfig-library.json
- tsconfig.json
- tsconfig-node.json
- tslint.json

The Makefile aliases the CLI commands as `make` commands.

## the CLI commands

`musical-patterns build`

Defaults to compile typescript using the "library" style configuration, but you can override this in your `Makefile.*` file.

`musical-patterns build_dev`

Same as above, but you can override separately (e.g. to set `mode: development` for `webpack`).
Used by the `use_latest_local` command.

`musical-patterns commit MSG="v1.0.33: good stuff"`

Generally meant to be run ad part of the ship command, but available if you're interested. 

Commits recursively (applying message to all submodules all the way down).

`musical-patterns lint`

Uses tslint.

`musical-patterns publish`

Patches and publishes to npm.

`musical-patterns pull`

Pulls from Github, including all submodules recursively (also updates them).

`musical-patterns push`

Pushes to Github, including all submodules.

`musical-patterns share_config`

This command is run automatically with `npm` `postinstall` when this is installed as an npm package, but can be re-run at any time. 

Replaces the common configuration files in your repo with the current standards for Musical Patterns.

`musical-patterns share_file`

Shares a specific file from here into your repo. This is the command that `share_config` uses for each file.

`musical-patterns ship MSG="improves the tests"`

The omni-command. 

- runs tests
- runs the linter
- patches the version
- commits all changes (appending your MSG to the new version number as the message)
- pushes
- publishes

`musical-patterns stash MSG="stashing this important thing"`

Stashes recursively.

`musical-patterns stash_pop MSG="stashing this important thing"`

Pops matching stashes recursively.

`musical-patterns switch_back_to_remote REPO=performer`

Undoes the `use_latest_local` command.

`musical-patterns test`

Runs your tests.

`musical-patterns use_latest_local REPO=performer`

To save oneself from deploying experimental changes to the remote, will simulate having the changes by building your local changes and installing those instead.
