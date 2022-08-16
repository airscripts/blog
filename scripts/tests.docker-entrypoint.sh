#!/bin/bash
set -e

if [ "$1" = 'bats' ]; then
  make tests-base

else 
  exec "$@"
fi