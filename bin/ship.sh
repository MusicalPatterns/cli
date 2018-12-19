#!/usr/bin/env sh

set -e

make test
make lint

VERSION=$(npm version patch)
git add .
make commit MSG="${VERSION}: ${MSG}"
make push
make publish
