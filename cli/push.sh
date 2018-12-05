#!/usr/bin/env sh

set -e

git push
git submodule foreach git push
