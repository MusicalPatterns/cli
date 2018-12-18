#!/usr/bin/env sh

set -e

update_recursively() {
	npm i
	npm update
	npm i
	git submodule foreach update_recursively
}
export -f update_recursively
update_recursively
