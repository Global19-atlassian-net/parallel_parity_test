#!/bin/bash
source ./globals.sh

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

export STARTTIME=$(printf "%x" $(($(date +%s) + $OFFSET)))
mini

cd $DIR/parity 
parallel -v -j $PARALLEL_CONCURRENCY \
  "$CMD" ::: $NODES


docker-compose -p $PROJECT up -d

#$DIR/docker_cmd.sh build -t parity -f parity/Dockerfile.run parity/
