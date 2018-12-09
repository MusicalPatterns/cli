#!/usr/bin/env sh

set -e

update_dependencies() {
	npm update
	git submodule foreach update_dependencies
}

update_dependencies
