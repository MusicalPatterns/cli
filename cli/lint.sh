#!/usr/bin/env sh

tslint '**/*.ts{,x}' --fix
tslint 'test/**/*.ts{,x}' --fix
