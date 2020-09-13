#!/usr/bin/env bash
auth=$(python -c "import base64; print base64.b64encode('${ES_USERNAME}:${ES_PASSWORD}')")

echo 'update interstellar'
curl \
    -XPUT 'https://elastic.dubas.dev/movies/_doc/109487?pretty&if_seq_no=8&if_primary_term=1' \
    -H 'Content-Type: application/json' \
    -H "Authorization: Basic ${auth}" \
    -d '{"genre": ["IMAX", "Sci-Fi"], "title": "InterStellar", "year": 2014}'

echo 'update conflict interstellar'
curl \
    -XPUT 'https://elastic.dubas.dev/movies/_doc/109487?pretty&if_seq_no=8&if_primary_term=1' \
    -H 'Content-Type: application/json' \
    -H "Authorization: Basic ${auth}" \
    -d '{"genre": ["IMAX", "Sci-Fi"], "title": "Interstellar", "year": 2014}'

echo 'update partial interstellar with retry on conflict'
curl \
    -XPOST 'https://elastic.dubas.dev/movies/_doc/109487/_update?retry_on_conflict=5&pretty' \
    -H 'Content-Type: application/json' \
    -H "Authorization: Basic ${auth}" \
    -d '{"doc": {"title": "Interstellar"}}'
