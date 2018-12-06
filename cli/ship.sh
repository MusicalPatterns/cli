#!/usr/bin/env sh

make test
make lint
VERSION=$(npm version patch)
git add .
git commit -m "${VERSION}: ${MSG}"
make push
make publish
