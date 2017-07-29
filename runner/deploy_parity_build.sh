#!/bin/bash
mini
source ./globals.sh

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

$DIR/docker_compose_cmd.sh -f parity/docker-compose.yml build

export DC_COMMAND="./initial.sh"
$DIR/docker_compose_cmd.sh -f parity/docker-compose.yml up -d

