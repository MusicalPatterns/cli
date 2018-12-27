#!/usr/bin/env sh

set -e

git submodule foreach --recusive 'git stash pop'
