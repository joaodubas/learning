#!/usr/bin/env bash
auth=$(python -c "import base64; print base64.b64encode('${ES_USERNAME}:${ES_PASSWORD}')")

echo 'create elasticsearch index'
curl \
    -XPUT https://elastic.dubas.dev/shakespeare \
    -H 'Content-Type: application/json' \
    -H "Authorization: Basic ${auth}" \
    --data-binary @shakes-mapping.json

echo 'populate elasticsearch index'
curl \
    -XPUT https://elastic.dubas.dev/shakespeare/_bulk \
    -H 'Content-Type: application/json' \
    -H "Authorization: Basic ${auth}" \
    --data-binary @shakespeare_7.0.json

echo 'check available indices'
curl \
    -XGET https://elastic.dubas.dev/_cat/indices \
    -H "Authorization: Basic ${auth}"
