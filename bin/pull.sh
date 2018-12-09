#!/usr/bin/env sh

set -e

pull_recursively() {
	git checkout master
	git submodule update --init --recursive
	git pull -r
	git submodule foreach pull_recursively
}
export -f pull_recursively
pull_recursively
