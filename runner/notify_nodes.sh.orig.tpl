#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
./update.sh

source ./globals.sh

{% for n in range(aws.nodes) %}
{% set othernodes = [] %}
{% for i in range(aws.nodes) %}
{% if i == n %}
SOURCE="{{ projectname }}-node{{ n }}"
{% else %}
  {% set _ = othernodes.append(i) %}
{% endif %}
{% endfor %}
OTHERNODES="{{ projectname }}-node{{ othernodes|join(" " + projectname + "-node") }}"

S_IP=$(docker-machine ip $SOURCE)
export NODE_ENODE=$(curl --data '{"jsonrpc":"2.0","method":"parity_enode","params":[],"id":0}' -H "Content-Type: application/json" -X POST $S_IP:8540 | jq -r '.result')
export CURL_JSON="{\"jsonrpc\":\"2.0\",\"method\":\"parity_addReservedPeer\",\"params\":[\""${NODE_ENODE}"\"],\"id\":0}"
echo "$CURL_JSON"

{% endfor %}

