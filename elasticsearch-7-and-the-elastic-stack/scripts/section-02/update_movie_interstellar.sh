#!/usr/bin/env bash
auth=$(python2 -c "import base64; print base64.b64encode('${ES_USERNAME}:${ES_PASSWORD}')")

echo 'full update for insterstellar'
curl \
    -XPUT https://elastic.dubas.dev/movies/_doc/109487?pretty \
    -H 'Content-Type: application/json' \
    -H "Authorization: Basic ${auth}" \
    -d '{"genre": ["IMAX", "Sci-Fi"], "title": "Interstellar - The Movie", "year": 2014}'

echo 'partial update for interstellar'
curl \
    -XPOST https://elastic.dubas.dev/movies/_doc/109487/_update?pretty \
    -H 'Content-Type: application/json' \
    -H "Authorization: Basic ${auth}" \
    -d '{"doc": {"title": "Interstellar"}}'
