#!/usr/bin/env sh

set -e

git submodule foreach --recursive 'git stash pop $(git stash list | grep "${MSG}" | cut -d: -f1) || true'
