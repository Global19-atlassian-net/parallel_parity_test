#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
./update.sh

source ./globals.sh

# Verify AWS tokens
[[  ! -n "$AWS_ACCESS_KEY_ID" || ! -n "AWS_SECRET_ACCESS_KEY" ]] && {
   echo "Please define the apporpriate AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables."
   exit 1
}

parallel -v -j $PARALLEL_CONCURRENCY \
  docker-machine create --driver amazonec2 --amazonec2-open-port 8540 ::: $NODES
  
  

