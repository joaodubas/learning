#!/usr/bin/env bash
auth=$(python -c "import base64; print base64.b64encode('${ES_USERNAME}:${ES_PASSWORD}')")

echo 'delete dark knight movie'
curl \
-XDELETE https://elastic.dubas.dev/movies/_doc/58559?pretty \
-H 'Content-Type: application/json' \
-H "Authorization: Basic ${auth}"
