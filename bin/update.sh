#!/usr/bin/env sh

set -e

function update_dependencies {
	npm update
	git submodule foreach update_dependencies
}

update_dependencies
