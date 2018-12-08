#!/usr/bin/env sh

set -e

rm -rf ../fake_npm_${REPO}

npm uninstall @musical-patterns/${REPO}
npm i -D @musical-patterns/${REPO}@latest
