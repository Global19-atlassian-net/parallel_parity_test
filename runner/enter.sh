#!/bin/bash
source ./globals.sh

docker $(docker-machine config $PROJECT-node${1}) exec parity_parity_1 bash
