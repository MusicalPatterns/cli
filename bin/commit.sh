#!/usr/bin/env sh

set -e

commit_recursively() {
	git add .
	git commit -m "${MSG}"
	git submodule foreach commit_recursively
}
export -f commit_recursively
commit_recursively
