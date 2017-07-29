#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
./update.sh

source ./globals.sh

cd $DIR/parity/generated_configs
chmod u+x ./bulk_configs.sh
./bulk_configs.sh
cd $DIR

$DIR/docker_compose_cmd.sh -f parity/docker-compose.yml build
$DIR/docker_compose_cmd.sh -f parity/docker-compose.yml stop
$DIR/docker_compose_cmd.sh -f parity/docker-compose.yml rm -f 
