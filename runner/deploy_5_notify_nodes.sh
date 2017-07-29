#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
./update.sh

source ./globals.sh

export SOURCE="ouroboros-node0"
export OTHERNODES="ouroboros-node1"

S_IP=$(docker-machine ip $SOURCE)
export NODE_ENODE=$(curl --data '{"jsonrpc":"2.0","method":"parity_enode","params":[],"id":0}' -H "Content-Type: application/json" -X POST $S_IP:8540 | jq -r '.result')
export CURL_PAYLOAD='{\"jsonrpc\":\"2.0\",\"method\":\"parity_addReservedPeer\",\"params\":[\""'${NODE_ENODE}'"\"],\"id\":0}'
echo "$CURL_PAYLOAD"

export NODES="$OTHERNODES"

./curl_cmd.sh 

export SOURCE="ouroboros-node1"
export OTHERNODES="ouroboros-node0"

S_IP=$(docker-machine ip $SOURCE)
export NODE_ENODE=$(curl --data '{"jsonrpc":"2.0","method":"parity_enode","params":[],"id":0}' -H "Content-Type: application/json" -X POST $S_IP:8540 | jq -r '.result')
export CURL_PAYLOAD='{\"jsonrpc\":\"2.0\",\"method\":\"parity_addReservedPeer\",\"params\":[\""'${NODE_ENODE}'"\"],\"id\":0}'
echo "$CURL_PAYLOAD"

export NODES="$OTHERNODES"

./curl_cmd.sh 

