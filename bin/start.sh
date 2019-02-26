#!/usr/bin/env bash

if [[ ${open} == "false" ]] ; then
	START_PART="--open=false"
else
	START_PART=""
fi

touch running

webpack-dev-server --config webpack.qa.js --color ${START_PART}
