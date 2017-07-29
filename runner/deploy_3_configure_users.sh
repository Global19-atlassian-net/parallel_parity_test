#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
./update.sh

source ./globals.sh

./docker_cmd.sh exec parity_parity_1 /parity/run_curl.sh stakeholder_setup
sleep 2

./docker_cmd.sh exec parity_parity_1 /parity/run_curl.sh non_stakeholder_setup
sleep 2

