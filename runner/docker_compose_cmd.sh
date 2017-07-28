#!/bin/bash
source ./globals.sh

PARAMS="$@"
CMD='export MACHINE={}; \
  echo "Machine {}"; \
  echo "Cmd: '$PARAMS'"; \
  docker-compose $(docker-machine config $MACHINE) '$PARAMS''
  
parallel -v -j $PARALLEL_CONCURRENCY \
  "$CMD" ::: $NODES
  
  

