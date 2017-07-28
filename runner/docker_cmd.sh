#!/bin/bash
source ./globals.sh

PARAMS="$@"
CMD='MACHINE={}; \
  echo "Machine {}"; \
  echo "Cmd: '$PARAMS'"; \
  docker $(docker-machine config $MACHINE) '$PARAMS''
  
parallel -v -j $PARALLEL_CONCURRENCY \
  "$CMD" ::: $NODES
  
  

