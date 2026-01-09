#!/bin/bash

SERVICE="nginx"
LOG_TAG="service_watchdog"

if ! systemctl is-active --quiet $SERVICE; then
  logger -t $LOG_TAG "$SERVICE is DOWN. Attempting restart."
  systemctl restart $SERVICE

  sleep 3
  systemctl is-active --quiet $SERVICE || \
    logger -t $LOG_TAG "CRITICAL: $SERVICE failed to restart"
fi
echo "Service watchdog check completed."