#!/bin/sh
echo "Building Docker image..."
docker build -f .docker/blog.Dockerfile -t airscript/blog:$1 .