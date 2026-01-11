#!/usr/bin/env bash

set -e

push_recursively() {
	git push || return
	git submodule foreach push_recursively
}
export -f push_recursively
push_recursively
