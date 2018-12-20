#!/usr/bin/env sh

set -e

make test
make lint
export VERSION=$(npm version patch)
make publish
git add .
make commit MSG="${VERSION}: ${MSG}"
make push
