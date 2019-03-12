#!/usr/bin/env bash

kill_on_port() {
	PORT_TO_KILL=${1}

	netstat -an | grep ${PORT_TO_KILL} | grep -m1 LISTEN > /dev/null 2>&1
	if [[ $? -ne 1 ]] ; then
		PID_TO_KILL=$(netstat -aon | grep -m1 ${PORT_TO_KILL} | grep LISTEN | awk '{print $5}')
		taskkill //pid ${PID_TO_KILL} //f > /dev/null 2>&1
	fi
}

REPO=$(basename "$PWD")
PORT_TO_KILL_ON=$(sed -n "s/^${REPO}://p" ports.txt)
DEFAULT_PORT=$(sed -n "s/^default://p" ports.txt)

kill_on_port ${PORT_TO_KILL_ON:=${DEFAULT_PORT}}
