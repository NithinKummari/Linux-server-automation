#!/bin/bash

CRON_FILE="/tmp/project_cron"

echo "Setting up cron jobs..."

cat <<EOF > $CRON_FILE
0 1 * * * /home/ubuntu/linux-automation/scripts/update.sh
0 2 * * * /home/ubuntu/linux-automation/scripts/backup.sh
*/30 * * * * /home/ubuntu/linux-automation/scripts/disk_check.sh
0 3 * * * /home/ubuntu/linux-automation/scripts/log_cleaner.sh
EOF

crontab $CRON_FILE
rm $CRON_FILE

echo "Cron jobs installed. Use 'crontab -l' to verify."
