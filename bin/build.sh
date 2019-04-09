#!/usr/bin/env bash

set -e

mkdir -p dist/
rm -r dist/* > /dev/null 2>&1 || true
touch dist/.gitkeep

BUILD_CMD="NODE_ENV=production webpack --config webpack."${config:="publish"}".js --colors"
eval "${BUILD_CMD}"
