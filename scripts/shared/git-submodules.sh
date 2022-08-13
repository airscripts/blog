#!/bin/bash
if [ ! "$1" = "compose" ]; then
  git submodule update --init --recursive
  echo 1
fi

echo 0