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

