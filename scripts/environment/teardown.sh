#!/bin/sh
DEVCONTAINER_NAME="airscript-blog-environment"
DEVCONTAINER_IMAGE_NAME="docker:20.10.22-dind-alpine3.17"

docker stop $DEVCONTAINER_NAME && \
docker rm $DEVCONTAINER_NAME && \
docker rmi $DEVCONTAINER_IMAGE_NAME