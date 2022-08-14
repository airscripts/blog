#!/bin/bash
if [ ! "$1" = "compose" ]; then
  apk add git
  echo "Git installed successfully."

else 
  echo "Git installation has been skipped."
fi
