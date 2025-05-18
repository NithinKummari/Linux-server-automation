#!/bin/bash
find /var/log -type f -name "*.log" -mtime +7 -exec rm -f {} \;
echo "Old logs cleaned on $(date)" >> /var/log/log_cleanup.log
