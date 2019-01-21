#!/usr/bin/env bash

VERSION=$(cat package.json 2>/dev/null | grep version | head -1 | awk -F: '{ print $2 }' | sed 's/[",]//g' | tr -d '[[:space:]]')
PACKAGE_NAME=$(node -e "try {var pack=require('./package.json'); console.log(pack.name); } catch(e) {}")
PUBLISHED_VERSION=$(npm show ${PACKAGE_NAME} version)

set -e

if [[ "${VERSION}" == "${PUBLISHED_VERSION}" ]] ; then
	VERSION_PREFIX=""
else
	VERSION_PREFIX="${VERSION}: "
fi

commit_recursively() {
	git submodule foreach commit_recursively || return
	git add . || return
	git commit --allow-empty-message -m "${VERSION_PREFIX}${msg}" || true
}
export -f commit_recursively
commit_recursively
