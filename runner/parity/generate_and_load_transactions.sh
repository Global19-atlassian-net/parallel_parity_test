#!/bin/bash

if [[ ! -f /tmp/running_transactions ]] && {
  echo "Still running, please wait..."
  exit 0
}

echo "Launching..."
nohup /parity/generate_and_load_transactions.sh &


