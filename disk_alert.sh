#!/bin/bash

# Disk Usage Alert Script for Linux

THRESHOLD=80
EMAIL='admin@gmail.com'
LOG_FILE="/tmp/disk_usage_alert.log"

DISK_STATS=$(df -h / | awk 'NR==2 {print $5 " " $4 " " $6}')
USAGE=$(echo $DISK_STATS | awk '{print $1}' | sed 's/%//g')
AVAILABLE=$(echo $DISK_STATS | awk '{print $2}')
MOUNTED_ON=$(echo $DISK_STATS | awk '{print $3}')
TIMESTAMPS=$(date '+%Y-%m-%d %H:%M:%S')

if [ "$USAGE" -ge "$THRESHOLD" ]; then
	MESSAGE ="Disk usage alert on $(hostname) at $TIMESTAMPS.
	Root filesystem is $USAGE% full ($AVAILABLE available on $MOUNTED_ON)."
	echo "$MESSAGE" >> "$LOG_FILE"
	echo "$MESSAGE" | mail -s "Disk Usage alert: $USAGE% full" "$EMAIL"
else
	echo "$TIMESTAMP -ok: $USAGE% used, $AVAILABLE available." >> "$LOG_FILE"
fi
