#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
./update.sh

source ./globals.sh

[ -f /usr/local/bin/jq ] || {
  curl -L https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 > /usr/local/bin/jq
  chmod a+x /usr/local/bin/jq
}

docker $(docker-machine config $PROJECT-node0) exec parity_parity_1 /parity/analyze_blocks.sh $1 $2 | tee analysis.csv

