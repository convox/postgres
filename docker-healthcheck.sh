#!/bin/sh

psql -h "localhost" -U "postgres" -c '\l'
ret_code=$?

# Docker healthcheck requires we only over exit 0 or 1 so this captures the
# other exit codes and coverts them all to a simple exit 1
if [ $ret_code != 0 ]; then
  exit 1
fi
