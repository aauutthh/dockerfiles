#!/bin/bash

set -e
if [[ $# -eq 0 ]] ; then
  exec /opt/openresty/bin/openresty -p /data/openresty/workspace -g "daemon off;"
fi

if [[ $1 == "-"* ]]; then
  exec /opt/openresty/bin/openresty -p /data/openresty/workspace -g "daemon off;" $@
fi

exec $@
