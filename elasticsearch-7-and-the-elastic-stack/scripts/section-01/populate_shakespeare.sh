#!/usr/bin/env bash
auth=$(python -c "import base64; print base64.b64encode('${ES_USERNAME}:${ES_PASSWORD}')")

CURRDIR=$(dirname $(readlink -f ${0}))
ROOTDIR=${CURRDIR}/../..
DOWNDIR=${ROOTDIR}/downloads

echo 'create elasticsearch index'
curl \
    -XPUT https://elastic.dubas.dev/shakespeare \
    -H 'Content-Type: application/json' \
    -H "Authorization: Basic ${auth}" \
    --data-binary @${DOWNDIR}/shakes-mapping.json

echo 'populate elasticsearch index'
curl \
    -XPUT https://elastic.dubas.dev/shakespeare/_bulk \
    -H 'Content-Type: application/json' \
    -H "Authorization: Basic ${auth}" \
    --data-binary @${DOWNDIR}/shakespeare_7.0.json

echo 'check available indices'
curl \
    -XGET https://elastic.dubas.dev/_cat/indices \
    -H "Authorization: Basic ${auth}"
