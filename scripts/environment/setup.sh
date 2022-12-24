#!/bin/sh
apk update && \
sh scripts/install/bash.sh && \
bash scripts/install/make.sh && \
bash scripts/install/git.sh