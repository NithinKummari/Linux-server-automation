#!/bin/bash
THRESHOLD=80
LOG="/var/log/disk_alert.log"

df -H | grep '^/dev/' | while read line; do
    usage=$(echo $line | awk '{print $5}' | sed 's/%//')
    mountpoint=$(echo $line | awk '{print $6}')
    if [ "$usage" -ge "$THRESHOLD" ]; then
        echo "[$(date)] ALERT: Disk usage on $mountpoint is ${usage}%" | tee -a $LOG
    fi
done
