#!/bin/bash
source ./globals.sh

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$DIR/docker_cmd.sh build -t parity -f parity/Dockerfile.run parity/
