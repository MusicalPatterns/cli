#!/usr/bin/env sh

set -e

commit_recursively() {
	git submodule foreach commit_recursively
	git add .
	git commit -m "${MSG}" || true
}
export -f commit_recursively
commit_recursively
