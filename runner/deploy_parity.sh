#!/bin/bash
source ./globals.sh

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

export STARTTIME=$(printf "%x" $(($(date +%s) + $OFFSET)))
mini

$DIR/docker_compose_cmd.sh -f parity/docker-compose.yml build

export DC_COMMAND="initial-config.toml"
$DIR/docker_compose_cmd.sh -f parity/docker-compose.yml up -d
