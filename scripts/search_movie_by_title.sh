#!/usr/bin/env bash
auth=$(python -c "import base64; print base64.b64encode('${ES_USERNAME}:${ES_PASSWORD}')")

echo 'find movies by title'
curl \
    -XGET https://elastic.dubas.dev/movies/_search?pretty \
    -H 'Content-Type: application/json' \
    -H "Authorization: Basic ${auth}" \
    -d '{"query": {"match": {"title": "Star Trek"}}}'
