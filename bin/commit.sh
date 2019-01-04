#!/usr/bin/env bash

set -e

if [[ ${VERSION} == "" ]] ; then
	VERSION_PREFIX=""
else
	VERSION_PREFIX="${VERSION}: "
fi

commit_recursively() {
	git submodule foreach commit_recursively || return
	git add . || return
	git commit --allow-empty-message -m "${VERSION_PREFIX}${MSG}" || true
}
export -f commit_recursively
commit_recursively
