#!/usr/bin/env bash

ncu -u -a -e 2
if [[ $? == 1 ]] ; then
	npm i
	npm upgrade
fi
