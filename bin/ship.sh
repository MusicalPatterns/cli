#!/usr/bin/env sh

set -e

make test
make lint

VERSION=$(npm version patch)
make commit MSG="${VERSION}: ${MSG}"
make push
make publish
