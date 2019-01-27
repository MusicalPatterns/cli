#!/usr/bin/env bash

set -e

BUILD_CMD="${1}"
DEFAULT_BUILD_CMD="webpack --config webpack.publish.js"

mkdir -p dist/
rm -r dist/* > /dev/null 2>&1 || true
touch dist/.gitkeep

eval "${BUILD_CMD:=${DEFAULT_BUILD_CMD}}"
