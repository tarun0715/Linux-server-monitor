#!/bin/bash

BASE="$HOME/linux_practice/automation"
DATA="$BASE/data"
BACKUP="$BASE/backup"
REPORT="$BASE/report.txt"

FAILED=0

echo "=================="
echo "Maintenance Project"
echo "=================="

# Disk Check

echo
echo "[1] Checking Disk"

CAPACITY=80

USAGE=$(df -P / | awk 'NR==2 {print 5}' | tr -d "%" )

echo "Disk Usage: $USAGE%"

if [ "$USAGE" -ge "$CAPACITY" ]; then
	echo "Check the disk space $USAGE percent"
	FAILED=1
else
	echo "Normal Disk $USAGE percent"
fi

# service
echo
echo "[2]Checking Service Status"

if  systemctl is-active --quiet ssh; then
	echo "Service is running"
else
	echo "service is not running"
	FAILED=1
fi

#Backup

echo
echo "[3] Checking the backup"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVE="$BACKUP\backup_file_$TIMESTAMP.tar.gz"

if tar -czf "$ARCHIVE" -C "$DATA" .;then
	echo "Backup Complete"
else
	echo "Backup Failed"
fi

#System Report 

echo 
echo "[4] Checking the Report "

{
	echo "====SYSTEM REPORT===="
	echo "Date: $(date)"
	echo "Hostname: $(hostname)"
	echo
} > "$REPORT" 

echo "Report Saved"

if [ "$FAILED" -eq 0 ]; then
	echo "Maja done"
	exit 0
else
	echo"Maja Failed"
	exit1
fi 

echo
