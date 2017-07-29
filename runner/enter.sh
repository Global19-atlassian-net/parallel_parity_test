#!/bin/bash
source ./globals.sh

docker $(docker-machine config $PROJECT-node${1}) exec -it parity_parity_1 bash
