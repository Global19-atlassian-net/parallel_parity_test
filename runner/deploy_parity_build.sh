#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
./update.sh

source ./globals.sh

export DC_COMMAND="./initial.sh"
$DIR/docker_compose_cmd.sh -f parity/docker-compose.yml up --force-recreate -d
