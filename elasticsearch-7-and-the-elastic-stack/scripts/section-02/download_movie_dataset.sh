#!/usr/bin/env bash

CURRDIR=$(dirname $(readlink -f ${0}))
ROOTDIR=${CURRDIR}/../..
DOWNDIR=${ROOTDIR}/downloads

echo 'download movielens data'
(cd ${DOWNDIR}; curl -LO http://files.grouplens.org/datasets/movielens/ml-latest-small.zip)

echo 'unzip movielens data'
(cd ${DOWNDIR}; unzip ml-latest-small.zip)
