#!/bin/bash

BASE_URL="http://localhost:8000"

echo "Testing /health endpoint..."
curl -f $BASE_URL/health || exit 1

echo ""
echo "Testing POST /services..."

SERVICE_RESPONSE=$(curl -s -X POST $BASE_URL/services \
-H "Content-Type: application/json" \
-d '{"name":"google","url":"https://google.com"}')

echo $SERVICE_RESPONSE

echo ""
echo "Testing duplicate service..."

DUPLICATE_STATUS=$(curl -s -o /dev/null -w "%{http_code}" \
-X POST $BASE_URL/services \
-H "Content-Type: application/json" \
-d '{"name":"google","url":"https://google.com"}')

if [ "$DUPLICATE_STATUS" != "409" ]; then
  echo "Duplicate service test failed"
  exit 1
fi

echo ""
echo "Testing GET /services..."

curl -f $BASE_URL/services || exit 1

echo ""
echo "Testing POST /incidents..."

curl -f -X POST $BASE_URL/incidents \
-H "Content-Type: application/json" \
-d '{"service_name":"google","title":"API Down","severity":"major"}' || exit 1

echo ""
echo "Testing GET /incidents..."

curl -f $BASE_URL/incidents || exit 1

echo ""
echo "All integration tests passed!"
