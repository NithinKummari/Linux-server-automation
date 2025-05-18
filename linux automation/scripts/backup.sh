#!/bin/bash

SRC="/etc"
DEST="/backup/etc_$(date +%F).tar.gz"

mkdir -p /backup
tar -czf $DEST $SRC
echo "Backup taken on $(date)" >> /var/log/backup.log
