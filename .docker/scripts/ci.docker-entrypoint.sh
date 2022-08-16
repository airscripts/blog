#!/bin/bash
set -e

if [ "$1" = 'circleci' ]; then
  circleci config validate .circleci/config.yml
  circleci config validate .circleci/workflows.yml

else 
  exec "$@"
fi
