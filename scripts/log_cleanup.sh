#!/bin/bash

LOG_DIR="/var/log"
DAYS=7
LOG_TAG="log_cleanup"

find $LOG_DIR -type f -name "*.log" -mtime +$DAYS -exec rm -f {} \;

logger -t $LOG_TAG "Deleted log files older than $DAYS days"
echo "Log cleanup completed."
