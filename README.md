[![Build Status](https://travis-ci.com/MusicalPatterns/cli.svg?branch=master)](https://travis-ci.com/MusicalPatterns/cli)

# Musical Patterns - CLI

The Musical Patterns CLI provides all the common commands, configuration, and dependencies for developing a Musical Patterns repo.

It works for both service and pattern repos.

When you install it as an `npm` package, `@musical-patterns/cli` copies its configuration files up into the installing repo.

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
- tsconfig.common.json
- tsconfig.json
- tsconfig.node.json
- tslint.json
- webpack.browser.js
- webpack.common.js
- webpack.deploy.js
- webpack.dev.js
- webpack.prod.js
- webpack.library.js
- webpack.qa.js
- webpack.local.js
- webpack.publish.js

The Makefile aliases the CLI commands as `make` commands.

## the CLI commands

`musical-patterns-cli build`

Defaults to compile typescript using the "library" style configuration, but you can override this in your `Makefile.*` file.

`musical-patterns-cli build-local`

Same as above, but you can override separately (e.g. to set `mode: development` for `webpack`).
Used by the `use-latest-local` command.

`musical-patterns-cli commit msg="v1.0.33: good stuff"`

Generally meant to be run ad part of the ship command, but available if you're interested. 

Commits recursively (applying message to all submodules all the way down).

`musical-patterns-cli fast-ship msg="v1.0.33: good stuff"`

Same as ship, but without checking the config still matches, linting, or running tests.

`musical-patterns-cli lint`

Uses tslint.

`musical-patterns-cli publish`

Patches and publishes to npm.
It tries to be nice and not publish if your working tree is clean, but if you just accidentally cleaned it without publishing, you can provide `force=true` and it will publish anyway.

`musical-patterns-cli pull`

Pulls from Github, including all submodules recursively (also updates them).

`musical-patterns-cli push`

Pushes to Github, including all submodules.

`musical-patterns-cli ship msg="improves the tests"`

The omni-command. 

- confirms that you haven't modified any of the standard configuration (if you have, consider whether all other repos should change similarly, and if so, change it here in the CLI; otherwise, figure some other way out)
- runs tests
- runs the linter
- patches the version
- commits all changes (appending your `msg` to the new version number as the message)
- pushes
- publishes

`musical-patterns-cli start`

Starts up a QA version of the service or pattern. Not all support this.

`musical-patterns-cli stash msg="stashing this important thing"`

Stashes recursively.

`musical-patterns-cli stash-pop msg="stashing this important thing"`

Pops matching stashes recursively.

`musical-patterns-cli switch-back-to-remote service=performer`

Undoes the `use-latest-local` command.

`musical-patterns-cli test`

Runs your tests.

`musical-patterns-cli use-latest-local service=performer`

To save oneself from deploying experimental changes to the remote, will simulate having the changes by building your local changes and installing those instead.
If you provide `built=true`, will skip re-building the target.
You can also pass it a `pattern` instead of a `service`.
