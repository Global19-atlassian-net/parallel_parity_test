#!/bin/bash

[ -f rm /tmp/running_transactions ] && {
  echo "Already running, please wait..."  
}

echo "Launching..."
nohup /parity/run_transactions.sh &


