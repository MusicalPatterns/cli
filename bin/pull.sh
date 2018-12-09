#!/usr/bin/env sh

set -e

function pull_recursively {
	git checkout master
	git submodule update --init --recursive
	git pull -r
	git submodule foreach pull_recursively
}
