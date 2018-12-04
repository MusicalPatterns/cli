#!/usr/bin/env sh

tslint '**/*.ts{,x}' --fix -p tsconfig.json
tslint 'test/**/*.ts{,x}' --fix -p tsconfig-node.json
