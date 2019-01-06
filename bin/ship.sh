#!/usr/bin/env bash

set -e

make match_config
make test
make lint
make publish
make commit
make push
