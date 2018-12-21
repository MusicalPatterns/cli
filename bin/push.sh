#!/usr/bin/env sh

set -e

push_recursively() {
	git push || return
	git submodule foreach push_recursively
}
export -f push_recursively
push_recursively
