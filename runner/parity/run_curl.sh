#!/bin/bash
FILENAME="$@"
curl --data @/parity/$FILENAME.json -H "Content-Type: application/json" -X POST localhost:8540