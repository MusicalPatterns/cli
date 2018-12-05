#!/usr/bin/env sh

set -e

npm uninstall @musical-patterns/${REPO}
npm i -D @musical-patterns/${REPO}@latest
