#!/usr/bin/env bash

if [[ ${open} == "false" ]] ; then
	START_PART="--open=false"
else
	START_PART=""
fi

NODE_ENV=development webpack-dev-server --config webpack.qa.js --color ${START_PART}
