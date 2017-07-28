#!/bin/bash
source ./globals.sh

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

export STARTTIME=$(printf "%x" $(($(date +%s) + $OFFSET)))
mini

$DIR/docker_cmd.sh build -t parity -f parity/Dockerfile.run parity/
