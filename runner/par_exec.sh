#!/bin/bash
source ./globals.sh

# Verify AWS tokens

[[  ! -n "$AWS_ACCESS_KEY_ID" || ! -n "AWS_SECRET_ACCESS_KEY" ]] && {
   echo "Please define the apporpriate AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables."
   exit 1
}
  
echo "Please wait while instances are being spawned (par jobs: $PARALLEL_CONCURRENCY )"
parallel --dry-run -v --eta -j $PARALLEL_CONCURRENCY time \
  docker-machine create --driver amazonec2 ::: $NODES
  
  

