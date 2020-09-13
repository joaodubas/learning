#!/usr/bin/env bash
auth=$(python -c "import base64; print base64.b64encode('${ES_USERNAME}:${ES_PASSWORD}')")

echo 'add movie mapping'
curl \
    -XPUT https://elastic.dubas.dev/movies \
    -H 'Content-Type: application/json' \
    -H "Authorization: Basic ${auth}" \
    -d '{"mappings": {"properties": {"year": {"type": "date"}}}}'
