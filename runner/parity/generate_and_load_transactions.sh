#!/bin/bash

[ -f rm /tmp/running_transactions ] && {
  echo "Already running, please wait..."  
  exit 0
}

echo "Launching..."
nohup /parity/run_transactions.sh > /dev/null &


