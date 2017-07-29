#!/bin/bash

CMD='MACHINE={}; \
     IP=$(docker-machine ip $MACHINE); \
     echo "$IP"'
     
parallel -v -j $PARALLEL_CONCURRENCY \
  "$CMD" ::: $NODES     

CMD='MACHINE={}; \
  IP=$(docker-machine ip $MACHINE); \
  curl --data "'"${CURL_PAYLOAD}"'" -H "Content-Type: application/json" -X POST $IP:'$PARITY_PORT''
  
echo "CMD: $CMD"

parallel -v -j $PARALLEL_CONCURRENCY \
  "$CMD" ::: $NODES
  
  

