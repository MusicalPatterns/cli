#!/usr/bin/env sh

set -e

push_recursively() {
	git push
	git submodule foreach push_recursively
}

push_recursively
