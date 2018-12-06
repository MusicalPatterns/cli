#!/usr/bin/env sh

make test
make lint
VERSION=$(npm version patch)
VERSIONED=$?
if [[ ${VERSIONED} -ne 0 ]] ; then
	printf "This project does not publish itself to npm. "
fi
git add .
git commit -m "${VERSION}: ${MSG}"
make push
if [[ ${VERSIONED} -ne 1 ]] ; then
	make publish
fi
