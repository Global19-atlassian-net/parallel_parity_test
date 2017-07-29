#!/bin/bash
mini
source ./globals.sh

FILENAME="$@"
CMD='MACHINE={}; \
  echo "Machine {}"; \
  echo "Cmd: '$PARAMS'"; \
  IP=$(docker-machine ip $MACHINE); \
  curl --data @'$FILENAME' -H "Content-Type: application/json" -X POST $IP:'$PARITY_PORT''
  
echo $CMD  
  
parallel -v -j $PARALLEL_CONCURRENCY \
  "$CMD" ::: $NODES
  
  

