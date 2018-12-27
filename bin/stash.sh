#!/usr/bin/env sh

set -e

stash_recursively() {
	git submodule foreach stash_recursively || return
	git add . || return
	git stash save "${MSG}" || true
}
export -f stash_recursively
stash_recursively
