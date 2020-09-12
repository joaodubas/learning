#!/usr/bin/env bash
echo 'download movielens data'
curl -LO http://files.grouplens.org/datasets/movielens/ml-latest-small.zip

echo 'unzip movielens data'
unzip ml-latest-small.zip
