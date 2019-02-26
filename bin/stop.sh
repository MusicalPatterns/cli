#!/usr/bin/env bash

kill_on_port() {
	PORT_TO_KILL=${1}

	netstat -an | grep ${PORT_TO_KILL} | grep -m1 LISTEN > /dev/null 2>&1
	if [[ $? -ne 1 ]] ; then
		PID_TO_KILL=$(netstat -aon | grep -m1 ${PORT_TO_KILL} | grep LISTEN | awk '{print $5}')
		taskkill //pid ${PID_TO_KILL} //f
	fi
}

if [[ -f running ]]; then
	kill_on_port 8081
	kill_on_port 8082
	kill_on_port 8083
	rm running
fi
