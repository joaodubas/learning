#!/usr/bin/env bash

CURRDIR=$(dirname $(readlink -f ${0}))
ROOTDIR=${CURRDIR}/../..
DOWNDIR=${ROOTDIR}/downloads

echo 'download mapping'
(cd ${DOWNDIR}; curl -LO http://media.sundog-soft.com/es7/shakes-mapping.json)

echo 'download data'
(cd ${DOWNDIR}; curl -LO http://media.sundog-soft.com/es7/shakespeare_7.0.json)
