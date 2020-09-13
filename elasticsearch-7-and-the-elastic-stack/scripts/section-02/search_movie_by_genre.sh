#!/usr/bin/env bash
auth=$(python2 -c "import base64; print base64.b64encode('${ES_USERNAME}:${ES_PASSWORD}')")

echo 'find movies by genre sci'
curl \
    -XGET https://elastic.dubas.dev/movies/_search?pretty \
    -H 'Content-Type: application/json' \
    -H "Authorization: Basic ${auth}" \
    -d '{"query": {"match_phrase": {"genre": "sci"}}}'

echo 'find movies by genre sci-fi'
curl \
    -XGET https://elastic.dubas.dev/movies/_search?pretty \
    -H 'Content-Type: application/json' \
    -H "Authorization: Basic ${auth}" \
    -d '{"query": {"match_phrase": {"genre": "sci-fi"}}}'

echo 'find movies by genre Sci-Fi'
curl \
    -XGET https://elastic.dubas.dev/movies/_search?pretty \
    -H 'Content-Type: application/json' \
    -H "Authorization: Basic ${auth}" \
    -d '{"query": {"match_phrase": {"genre": "Sci-Fi"}}}'
