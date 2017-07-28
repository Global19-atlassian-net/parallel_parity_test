#!/bin/bash
mini
source ./globals.sh

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

export STARTTIME=$(printf "%x" $(($(date +%s) + $OFFSET)))
mini
cd $DIR/parity/generated_configs
chmod u+x ./bulk_configs.sh
./bulk_configs.sh
cd $DIR

$DIR/docker_compose_cmd.sh -f parity/docker-compose.yml build

export DC_COMMAND="./initial.sh"
$DIR/docker_compose_cmd.sh -f parity/docker-compose.yml up -d

#FIXME: Is this necesarry?
sleep 5

exit 0

