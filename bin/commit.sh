#!/usr/bin/env bash

set -e

VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g')

commit_recursively() {
	git submodule foreach commit_recursively || return
	git add . || return
	git commit --allow-empty-message -m "${VERSION}: ${MSG}" || true
}
export -f commit_recursively
commit_recursively
