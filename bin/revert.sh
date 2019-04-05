#!/usr/bin/env bash

git revert HEAD^ --no-edit

PACKAGE_NAME=$(cat package.json 2>/dev/null | grep name | head -1 | awk -F: '{ print $2 }' | sed 's/[",]//g' | tr -d '[[:space:]]')
LATEST_VERSION=$(npm show ${PACKAGE_NAME} version)

CURRENT_VERSION=$(cat package.json 2>/dev/null | grep version | head -1 | awk -F: '{ print $2 }' | sed 's/[",]//g' | tr -d '[[:space:]]')

sed -i "s/\"version\"\: \"${CURRENT_VERSION}/\"version\"\: \"${LATEST_VERSION}/g" package.json
make commit msg="fixing package version from repository reversion, to match latest published ${LATEST_VERSION}"
