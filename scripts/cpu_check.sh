#!/bin/bash

THRESHOLD=80
LOG_TAG="cpu_check"

CPU_USAGE=$(top -bn1 | awk '/Cpu/ {print int(100 - $8)}')

if ! [[ "$CPU_USAGE" =~ ^[0-9]+$ ]]; then
  logger -t "$LOG_TAG" "CPU check failed: invalid value"
  exit 1
fi

if [ "$CPU_USAGE" -ge "$THRESHOLD" ]; then
  logger -t "$LOG_TAG" "High CPU usage detected: ${CPU_USAGE}%"
fi

echo "CPU usage check completed."

