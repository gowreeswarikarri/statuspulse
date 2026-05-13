#!/bin/bash

LOG_FILE=~/statuspulse-monitor.log

echo "[$(date)] Running health monitor..." >> $LOG_FILE

curl -f http://localhost:8000/health >> $LOG_FILE 2>&1

if [ $? -eq 0 ]; then
    echo "[$(date)] Health check successful" >> $LOG_FILE
else
    echo "[$(date)] Health check failed" >> $LOG_FILE
fi

docker ps >> $LOG_FILE
