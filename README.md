[![Build Status](https://travis-ci.com/MusicalPatterns/cli.svg?branch=master)](https://travis-ci.com/MusicalPatterns/cli)

# Musical Patterns - CLI

Provides all the common commands, configuration, and dependencies for developing a Musical Patterns repo.

Works for both service and pattern repos.

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
- test/jasmine.js
- test/mockDom.ts
- test/reporter.ts
- test/setup.ts
- test/tslint.json
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

The shared Makefile aliases the CLI commands as `make` commands.

But wait, there's more! The `cli` service is also responsible for executing the sharing of other services' configuration files.
At this time, both the `snapshot` and the `playroom` service stage files to be shared with the repos they're installed in.
Since every repo uses the `cli`, they rely on it to share their latest configuration when you install the `cli` after installing them.

## the CLI commands

`musical-patterns-cli build`

Defaults to compile typescript using the "library" style configuration, but you can override this in your `Makefile.*` file.

`musical-patterns-cli build-local`

Same as above, but you can override separately (e.g. to set `mode: development` for `webpack`).
Used by the `use-latest-local` command.

`musical-patterns-cli commit msg="v1.0.33: good stuff"`

Generally meant to be run along with the ship command, but available if you're interested. 

Commits recursively (applying message to all submodules all the way down).

`musical-patterns-cli lint`

Uses tslint.

`musical-patterns-cli publish`

Patches and publishes to npm.
It tries to be nice and not publish if your working tree is clean, but if you just accidentally cleaned it without publishing, you can provide `force=true` and it will publish anyway.

`musical-patterns-cli pull`

Pulls from Github, including all submodules recursively (also updates them).

`musical-patterns-cli push`

Pushes to Github, including all submodules.

`musical-patterns-cli restart`

Stops, then starts (naturally) the server.

`musical-patterns-cli run file=src/myFile.ts`

Compiles a TypeScript file using the necessary configuration and runs it.

`musical-patterns-cli ship msg="improves the tests"`

The omni-command. 

- confirms that you haven't modified any of the standard configuration (if you have, consider whether all other repos should change similarly, and if so, change it here in the CLI; otherwise, figure some other way out)
- runs tests
- runs the linter
- patches the version
- commits all changes (appending your `msg` to the new version number as the message)
- pushes
- publishes

Use option `fast=true` to skip the first few safety steps (config match checking, testing, and linting).
As with the `publish` command, you can use `force=true` if your working tree is clean but you want to ship anyway.

`musical-patterns-cli start`

Starts up a QA version of the service or pattern, if it exists.
You can pass `open=false` if you don't want it to automatically open a tab in your browser.

`musical-patterns-cli stash msg="stashing this important thing"`

Stashes recursively.

`musical-patterns-cli stash-pop msg="stashing this important thing"`

Pops matching stashes recursively.

`musical-patterns-cli stop`

Stops the server for the current pattern or service if it is running.

`musical-patterns-cli switch-back-to-remote service=performer`

Undoes the `use-latest-local` command. See that entry for more details.

`musical-patterns-cli test`

Runs your tests. Use `headful=true` for integration suites if you want to see what's going on.

`musical-patterns-cli use-latest-local service=performer`

To save oneself from deploying experimental changes to the remote, will simulate having the changes by building your local changes and installing those instead.
If you provide `built=true`, will skip re-building the target.
You can also pass it a `pattern` instead of a `service`. Write the pattern name in camel case.

### `make update`

One command is a bit special: `update`. It is included in the shared `Makefile` and can be run with `make update`.
But it does not actually use the `musical-patterns-cli`. It runs a bash script which is also shared into your `bin` folder.
If it did not avoid running the update command itself, it could not update itself.

That all said, here is the usage:

`make update pattern=performerQa`

Installs the latest version of a pattern or service. Respects whether it is a prod or dev dependency.
If run without a specified service or pattern, will update all @musical-patterns packages.
Write the pattern name in camel case.

Note: if the server for the current repo is running, and if `@musical-patterns/cli` itself is included in the updates, the `update` command calls `stop`; 
otherwise that would cause a failure for trying to delete the CLI's `start.sh` file which was running a process.

## configuration

### webpack

The idea here is that we've got some building block configs, not used directly by commands:

- `webpack.dev` vs `webpack.prod` 
- `webpack.browser` vs `webpack.library` 

Which the roll-ups are combinations of:

- `webpack.local` 		= **dev + library**, used by the `use-latest-local` (`build-local`, directly) command when you need a version of your library build for development
- `webpack.qa`:			= **dev + browser**, used by the `start` command, for automated testing and qa'ing the app yourself
- `webpack.publish`:	= **prod + library**, used by the `publish` (`build`, directly) command when you need a version of your library build for production
- `webpack.deploy`:		= **prod + browser**, used by no commands at this time, but hey, maybe in theory it could make sense

Each of these roll-ups also includes two other webpack configs: `webpack.common` and `webpack.self`. 
Common is common to all repos.
Self is provided by the repo itself (or shared with it by some service, such as `@musical-patterns/playroom`).

## typescript

(more on this later)
