#!/bin/bash
echo "Building Docker image..."
docker build -f .docker/dockerfiles/blog.Dockerfile -t airscript/blog:$1 .