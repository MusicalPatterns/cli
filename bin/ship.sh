#!/usr/bin/env sh

set -e

make test
make lint
export VERSION=$(npm version patch)
make publish
make commit
make push
