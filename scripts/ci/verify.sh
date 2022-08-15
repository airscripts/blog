#!/bin/bash
if [ "$1" = "base" ]; then
  apk --version

elif [ "$1" = "build" ]; then
  apk --version
  git --version
  hugo version
  
elif [ "$1" = "deploy" ]; then
  apk --version
  node -v
  npm -v
  netlify -v

elif [ "$1" = "publish" ]; then
  apk --version
  docker -v

else 
  echo ERROR: Environment not found.
  exit 1
fi