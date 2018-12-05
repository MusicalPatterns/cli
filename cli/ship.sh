#!/usr/bin/env sh

set -e

MSG="$1"

make test
make lint
VERSION=$(npm version patch)
git add .
gc -m "${VERSION}: ${MSG}"
make push
make publish
