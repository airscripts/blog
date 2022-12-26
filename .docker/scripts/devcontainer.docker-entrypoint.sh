#!/bin/bash
set -e

if [ "$1" = 'devcontainer' ]; then
  bash ./scripts/devcontainer/verify.sh

else 
  exec "$@"
fi
