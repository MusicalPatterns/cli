#!/usr/bin/env bash

VERSION=$(cat package.json 2>/dev/null | grep version | head -1 | awk -F: '{ print $2 }' | sed 's/[",]//g' | tr -d '[[:space:]]')

if [[ $(git log --grep=${VERSION}) == "" ]] ; then
	VERSION_PREFIX="${VERSION}: "
else
	VERSION_PREFIX=""
fi

commit_recursively() {
	git submodule foreach commit_recursively || return
	git add . || return
	git commit --allow-empty-message -m "${VERSION_PREFIX}${msg}" || true
}
export -f commit_recursively
commit_recursively
