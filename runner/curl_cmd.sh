#!/bin/bash

CMD='MACHINE={}; \
     IP=$(docker-machine ip $MACHINE); \
     echo "$IP"'
     
parallel -v -j $PARALLEL_CONCURRENCY \
  "$CMD" ::: $NODES     

CMD='MACHINE={}; \
  echo "MACHINE: {}"; \
  echo "PAYLOAD: '$CURL_PAYLOAD'"; \
  IP=$(docker-machine ip $MACHINE); \
  curl --data "'"${!CURL_PAYLOAD}"'" -H "Content-Type: application/json" -X POST $IP:'$PARITY_PORT''
  
echo $CMD  

parallel -v -j $PARALLEL_CONCURRENCY \
  "$CMD" ::: $NODES
  
  

