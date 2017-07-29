#!/bin/bash
source ./globals.sh

docker $(docker-machine config $PROJECT-node${1}) logs parity_parity_1 "$@"
