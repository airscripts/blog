#!/bin/sh
echo "Logging into Docker Hub..."
docker login --username $1 --password $2
