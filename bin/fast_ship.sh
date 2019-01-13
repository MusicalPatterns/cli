#!/usr/bin/env bash

set -e

make publish
make commit
make push
