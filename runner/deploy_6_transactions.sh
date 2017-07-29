#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
./update.sh

source ./globals.sh

./docker_cmd.sh exec parity_parity_1 /parity/generate_and_load_transactions.sh

