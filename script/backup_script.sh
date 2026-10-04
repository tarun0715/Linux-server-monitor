#!/bin/bash

SOURCE="$HOME/linux_practice/automation/data"
BACKUP="$HOME/linux_practice/automation/backup"

echo "Backup Script Started ..."

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIEVE="$BACKUP/app_backup_$TIMESTAMP.tar.gz"

tar -czf "$ARCHIEVE" -C "$SOURCE" .

if [ $? -eq 0 ]; then
	echo "BAckup success"
	echo "$ARCHIEVE"
	exit 0
else
	echo "BAckup Failed"
	exit 1
fi
