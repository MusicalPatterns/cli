#!/usr/bin/env sh

tslint 'src/**/*.ts{,x}' --fix -p ./tsconfig-jim.json
tslint 'test/**/*.ts{,x}' --fix -p ./tsconfig-node.json
