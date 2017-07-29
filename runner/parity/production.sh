#!/bin/bash

echo "Running prod..."

set -e
cd /parity

./out/parity --config config.toml
