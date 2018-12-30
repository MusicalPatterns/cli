#!/bin/bash

set -e

make test
make lint
make publish
make commit
make push
