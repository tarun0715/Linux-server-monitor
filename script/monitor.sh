#!/bin/bash

CAPACITY=80

USAGE=$(df -P / | awk 'NR==2 {print $5}' | tr -d '%' )

if [ "$USAGE" -ge "$CAPACTIY" ]; then
	echo "Capacity exceeds"
	exit 1
else
	echo "$USAGE Capacity within Limits"
	exit 0
fi

