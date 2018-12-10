#!/usr/bin/env sh

set -e

tslint 'src/**/*.ts{,x}' -e **/dist/** --fix -p ./tsconfig.json
tslint 'test/**/*.ts{,x}' --fix -p ./tsconfig-node.json
