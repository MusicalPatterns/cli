# Musical Patterns CLI

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

This command is run as an npm postinstall script when this is installed as an npm package, but can be re-run at any time. 

Replaces a number of basic configuration files for building, testing, starting, and linting with standards for Musical Patterns.

`musical-patterns ship MSG="improves the tests"`

The omni-command. 

- Runs tests
- Runs the linter
- patches the version
- commits all changes (appending your MSG to the new version number as the message)
- pushes
- publishes

`musical-patterns stash MSG="why i'm stashing"`

Stashes recursively.

`musical-patterns stash_pop`

Pops stashes recursively.

`musical-patterns switch_back_to_remote REPO=performer`

Undoes the above.

`musical-patterns test`

Uses Jasmine, browser-env.

`musical-patterns use_latest_local REPO=performer`

To save oneself from deploying experimental changes to the remote, will simulate having the changes by building your local changes and installing those instead.
