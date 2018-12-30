#!/usr/bin/env bash

set -e

stash_recursively() {
	git submodule foreach stash_recursively || return
	git add . || return
	git stash push -m "${MSG}" || true
}
export -f stash_recursively
stash_recursively
