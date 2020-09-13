#!/usr/bin/env bash
auth=$(python2 -c "import base64; print base64.b64encode('${ES_USERNAME}:${ES_PASSWORD}')")

echo 'create movie index'
curl \
    -XPUT https://elastic.dubas.dev/movies?pretty \
    -H 'Content-Type: application/json' \
    -H "Authorization: Basic ${auth}" \
    -d '{"mappings": {"properties": {"id": {"type": "integer"}, "year": {"type": "date"}, "genre": {"type": "keyword"}, "title": {"type": "text", "analyzer": "english"}}}}'
