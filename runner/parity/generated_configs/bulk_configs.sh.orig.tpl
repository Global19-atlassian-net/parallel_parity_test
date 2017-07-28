#!/bin/bash
{% for n in range(aws.nodes) %}

cat > {{ projectname }}-node{{ n }}.toml << EOF
[parity]
chain = "chain-spec.json"
base_path = "node"

[network]
port = 30300

[rpc]
port = 8540
apis = ["web3", "eth", "net", "personal", "parity", "parity_set", "traces", "rpc", "parity_accounts"]
interface = "all"
hosts = ["all"]

[ui]
port = 8180

[dapps]
port = 8080

[ipc]
disable = true

[account]
password = ["passwords"]

[mining]
engine_signer = "{{ node_list[n] }}"
reseal_on_txs = "none"
usd_per_tx = "0"
EOF

{% endfor %}