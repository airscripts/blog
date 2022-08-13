#!/bin/sh
netlify deploy --site $1 --auth $2 --prod --dir=public
