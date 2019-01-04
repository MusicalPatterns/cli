#!/usr/bin/env bash

. bin/non_cli/share_file.sh

share_file tsconfig-common.json
share_file tsconfig-library.json
share_file tsconfig.json
share_file tsconfig-node.json
share_file tslint.json
share_file test/tslint.json
share_file test/mockDom.ts
share_file test/reporter.ts
share_file test/jasmine.js
share_file Makefile
share_file .gitattributes
share_file .travis.yml
share_file LICENSE

share_file_with_npm_struggles .gitignore
share_file_with_npm_struggles .npmignore
