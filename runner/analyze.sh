#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
./update.sh

source ./globals.sh

./docker_cmd.sh exec -d parity_parity_1 /parity/analyze_blocks.sh $1 $2

