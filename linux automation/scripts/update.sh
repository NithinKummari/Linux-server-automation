#!/bin/bash
LOG="/var/log/update.log"
echo "[$(date)] Starting APT update..." | tee -a $LOG
apt update && apt upgrade -y
echo "[$(date)] APT update complete." | tee -a $LOG
