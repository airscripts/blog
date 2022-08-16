#!/bin/bash
if [ ! "$1" = "compose" ]; then
  git submodule update --init --recursive && \
  echo "Git submodule update executed."

else 
  echo "Git submodule update skipped."
fi