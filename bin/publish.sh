#!/usr/bin/env bash

set -e

make build
export VERSION=$(npm version patch)
npm publish --access public
