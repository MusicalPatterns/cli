#!/usr/bin/env bash

if [[ ${open} == "false" ]] ; then
	START_PART="--no-open"
else
	START_PART=""
fi

webpack-dev-server --config webpack.qa.js --color ${START_PART}
