#!/bin/bash

THRESHOLD=85
LOG_TAG="disk_check"

DISK_USAGE=$(df / | awk 'NR==2 {print int($5)}')

if [ "$DISK_USAGE" -ge "$THRESHOLD" ]; then
  logger -t $LOG_TAG "Disk usage critical: ${DISK_USAGE}% on root filesystem"
fi
echo "Disk usage check completed."