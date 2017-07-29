#!/bin/bash
mini
source ./globals.sh

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

export STARTTIME=$(printf "%x" $(($(date +%s) + $OFFSET)))

mini

cat parity/chain-spec.json
exit 1

cd $DIR/parity/generated_configs
chmod u+x ./bulk_configs.sh
./bulk_configs.sh
cd $DIR

$DIR/docker_compose_cmd.sh -f parity/docker-compose.yml build
