#!/usr/bin/env bash

set -e

git submodule foreach --recursive 'git stash pop $(git stash list | grep "${msg}" | cut -d: -f1) || true'
