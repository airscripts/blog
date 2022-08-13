#!/bin/bash
if [ "$1" = "build" ]; then
  apk --version
  
elif [ "$1" = "deploy" ]; then
  apk --version
  node -v
  npm -v

elif [ "$1" = "publish" ]; then
  apk --version

else 
  echo ERROR: Environment not found.
  exit 1
fi