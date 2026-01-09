#!/bin/bash

THRESHOLD=80
LOG_TAG="memory_check"

MEM_USAGE=$(free | awk '/Mem/ {printf("%d"), $3/$2 * 100}')

if [ "$MEM_USAGE" -ge "$THRESHOLD" ]; then
  logger -t $LOG_TAG "High memory usage detected: ${MEM_USAGE}%"
fi

echo "Memory usage check completed."
