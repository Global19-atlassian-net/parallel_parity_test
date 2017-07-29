#!/bin/bash
mini
source ./globals.sh

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

export DC_COMMAND="./production.sh"
$DIR/docker_compose_cmd.sh -f parity/docker-compose.yml up -d
