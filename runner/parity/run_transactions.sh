#!/bin/bash

touch /tmp/running_transactions
source /parity/address

time /parity-setup/target/release/parity-rpc-generator --config rpc-generator-config.json --seed $RANDSEED --filter-from $ADDRESS --transactions $TRANSACTIONS --chunk-size $CHUNKS --output /tmp/par

for i in /tmp/par*
do 
  echo $i
  curl --data @${i} -H "Content-Type: application/json" -X POST localhost:8540
  sleep 1 # Limit the transactions to avoid overwhelming the servers
done

rm /tmp/par*
rm /tmp/running_transactions

