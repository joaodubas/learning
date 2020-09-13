#!/usr/bin/env bash
auth=$(python -c "import base64; print base64.b64encode('${ES_USERNAME}:${ES_PASSWORD}')")

echo 'add movies in bulk'
curl \
    -XPOST https://elastic.dubas.dev/_bulk \
    -H 'Content-Type: application/json' \
    -H "Authorization: Basic ${auth}" \
    -d '
{"create": {"_index": "movies", "_id": "135569"}}
{"id": "135569", "title": "Star Trek Beyond", "year": 2016, "genre": ["Action", "Adventure", "Sci-Fi"]}
{"create": {"_index": "movies", "_id": "122886"}}
{"id": "122886", "title": "Star Wars: Episode VII - The Force Awakens", "year": 2015, "genre": ["Action", "Adventure", "Fantasy", "Sci-Fi", "IMAX"]}
{"create": {"_index": "movies", "_id": "109487"}}
{"id": "109487", "title": "Interstellar", "year": 2014, "genre": ["Sci-Fi", "IMAX"]}
{"create": {"_index": "movies", "_id": "58559"}}
{"id": "58559", "title": "Dark Kinght, The", "year": 2008, "genre": ["Action", "Crime", "Dram", "IMAX"]}
{"create": {"_index": "movies", "_id": "1924"}}
{"id": "1924", "title": "Plan 9 from Outer Space", "year": 1959, "genre": ["Horror", "Sci-Fi"]}
'
