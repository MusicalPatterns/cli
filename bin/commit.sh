#!/usr/bin/env bash

set -e

VERSION=$(cat package.json 2>/dev/null | grep version | head -1 | awk -F: '{ print $2 }' | sed 's/[",]//g' | tr -d '[[:space:]]')

if [[ "${VERSION}" == "" ]] ; then
	VERSION_PREFIX=""
else
	VERSION_PREFIX="${VERSION}: "
fi

commit_recursively() {
	git submodule foreach commit_recursively || return
	git add . || return
	git commit --allow-empty-message -m "${VERSION}: ${MSG}" || true
}
export -f commit_recursively
commit_recursively
