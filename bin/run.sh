#!/usr/bin/env bash

TS_FILE="${1}"

ts-node -P tsconfig.node.json ${TS_FILE}
