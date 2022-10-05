#!/usr/bin/env bash

set -e

pull_recursively() {
	git submodule update --init --recursive || return
	git checkout main || return
	git pull -r || return
	git submodule foreach pull_recursively
}
export -f pull_recursively
pull_recursively
