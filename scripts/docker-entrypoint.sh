#!/bin/bash
set -e

if [ "$1" = 'hugo' ]; then
  hugo server --bind $BLOG_INTERFACE --port $BLOG_PORT
fi

exec "$@"