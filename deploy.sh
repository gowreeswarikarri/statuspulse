#!/bin/bash

echo "Pulling latest code..."
git pull origin main

echo "Stopping containers..."
docker compose down

echo "Starting containers..."
docker compose up -d --build

echo "Waiting for app..."
sleep 20

echo "Health Check:"
curl -f http://localhost:8000/health

echo ""
echo "Deployment completed successfully!"
