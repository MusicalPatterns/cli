#!/usr/bin/env sh

FILE="$1"

ESCAPE_UTILITIES_DIRECTORY="../../../"

cp ${FILE} ${ESCAPE_UTILITIES_DIRECTORY}${FILE}
sed -i -e "/${FILE//\//\\/}/d" ${ESCAPE_UTILITIES_DIRECTORY}.gitignore
echo ${FILE} >> ${ESCAPE_UTILITIES_DIRECTORY}.gitignore
