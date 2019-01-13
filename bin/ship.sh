#!/usr/bin/env bash

set -e

make match_config
make test
make lint
make fast_ship
