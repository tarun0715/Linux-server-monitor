#!/bin/bash

LOG_DIR="$home/linux_project/automation/data/log"
RETENTION_DAYS=7

Data=$(find "$LOG_DIR" -type f -name ".*log" -mtime +"$RETENTION_DAYS")

if [ -z "$Data" ]; then
	echo "No log file"
else
	echo "Old file"
fi

echo
echo "Cleanup done"

exit 0
