#!/bin/bash

/usr/sbin/sshd
nginx

while true; do
	sleep 10s
	ps | grep nginx | grep master
	if [ $? == 1 ]; then break
	fi
	ps | grep sshd | grep listener
	if [ $? == 1 ]; then break
	fi
done