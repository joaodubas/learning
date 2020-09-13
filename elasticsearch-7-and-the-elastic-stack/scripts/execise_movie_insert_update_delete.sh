#!/usr/bin/env bash
auth=$(python -c "import base64; print base64.b64encode('${ES_USERNAME}:${ES_PASSWORD}')")

echo 'insert hitchhiker movie'
curl \
    -XPOST https://elastic.dubas.dev/movies/_doc/42?pretty \
    -H 'Content-Type: application/json' \
    -H "Authorization: Basic ${auth}" \
    -d "{\"genre\": [], \"title\": \"Hitchhiker's Guide To The Galaxy\", \"year\": 2005}"

echo 'full update hitchhiker movie'
curl \
    -XPUT https://elastic.dubas.dev/movies/_doc/42?pretty \
    -H 'Content-Type: application/json' \
    -H "Authorization: Basic ${auth}" \
    -d "{\"genre\": [\"Adventure\", \"Comedy\", \"Sci-Fi\"], \"title\": \"Hitchhiker's Guite To The Galaxy\", \"year\": 2005}"

echo 'partial update hitchhiker movie'
curl \
    -XPOST https://elastic.dubas.dev/movies/_doc/42/_update?pretty \
    -H 'Content-Type: application/json' \
    -H "Authorization: Basic ${auth}" \
    -d "{\"doc\": {\"title\": \"Hitchhiker's Guite to the Galaxy, The\"}}"

echo 'delete hitchhiker movie'

curl \
    -XDELETE https://elastic.dubas.dev/movies/_doc/42?pretty \
    -H 'Content-Type: application/json' \
    -H "Authorization: Basic ${auth}"
