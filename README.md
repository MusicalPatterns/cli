[![Build Status](https://travis-ci.com/MusicalPatterns/cli.svg?branch=master)](https://travis-ci.com/MusicalPatterns/cli)

# Musical Patterns - CLI

The Musical Patterns CLI provides all the commands and common configuration necessary to develop on a Musical Patterns repo.

When you install it as an `npm` package, `@musical-patterns/cli` copies its configuration files up into your repo's.

These configuration files are for building, testing, linting, publishing, storing, and sharing the code:

- .gitattributes
- .gitignore
- .idea/codeStyles/codeStyleConfig.xml
- .idea/codeStyles/Project.xml
- .idea/inspectionProfiles/Project_Default.xml
- .idea/jsLinters/tslint.xml
- .idea/compiler.xml
- .idea/encodings.xml
- .idea/jsLibraryMappings.xml
- .idea/misc.xml
- .idea/watcherTasks.xml
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

`musical-patterns check_match`

Confirm that your configuration files match the standards here in the CLI repo.

`musical-patterns commit MSG="v1.0.33: good stuff"`

Generally meant to be run ad part of the ship command, but available if you're interested. 

Commits recursively (applying message to all submodules all the way down).

`musical-patterns lint`

Uses tslint.

`musical-patterns publish`

Patches and publishes to npm.
It tries to be nice and not publish if your working tree is clean, but if you just accidentally cleaned it without publishing, you can provide `FORCE=true` and it will publish anyway.

`musical-patterns pull`

Pulls from Github, including all submodules recursively (also updates them).

`musical-patterns push`

Pushes to Github, including all submodules.

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

`musical-patterns switch_back_to_remote SERVICE=performer`

Undoes the `use_latest_local` command.

`musical-patterns test`

Runs your tests.

`musical-patterns use_latest_local SERVICE=performer`

To save oneself from deploying experimental changes to the remote, will simulate having the changes by building your local changes and installing those instead.
