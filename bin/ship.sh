#!/usr/bin/env sh

set -e

make test
make lint
make publish
make commit
make push
