#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

./deploy_1_build_and_clear.sh
sleep 5

./deploy_2_run_initialise.sh
sleep 5

./deploy_3_configure_users.sh
sleep 5

./deploy_4_production_mode.sh
sleep 5

./deploy_5_notify_nodes.sh
sleep 5

./deploy_6_transactions.sh
