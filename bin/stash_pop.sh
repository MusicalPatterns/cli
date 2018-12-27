#!/usr/bin/env sh

set -e

git submodule foreach --recursive 'git stash pop'
