#!/bin/bash

BACKUP_DIR=~/backups
DATE=$(date +%F-%H-%M-%S)

mkdir -p $BACKUP_DIR

docker exec statuspulse-postgres pg_dump -U postgres statuspulse > $BACKUP_DIR/statuspulse-$DATE.sql

echo "Backup completed: $BACKUP_DIR/statuspulse-$DATE.sql"
