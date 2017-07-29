#!/bin/bash

mkdir -p ouroboros-node0

cat > ouroboros-node0/config.toml << EOF
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
engine_signer = "0x00bd138abd70e2f00903268f3db08f2d25677c9e"
reseal_on_txs = "none"
usd_per_tx = "0"
EOF

cat > ouroboros-node0/stakeholder_setup.json << EOF
{"jsonrpc":"2.0","method":"parity_newAccountFromPhrase","params":["node0", "node0"],"id":0}
EOF

cat > ouroboros-node0/passwords << EOF
node0
EOF


mkdir -p ouroboros-node1

cat > ouroboros-node1/config.toml << EOF
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
engine_signer = "0x00aa39d30f0d20ff03a22ccfc30b7efbfca597c2"
reseal_on_txs = "none"
usd_per_tx = "0"
EOF

cat > ouroboros-node1/stakeholder_setup.json << EOF
{"jsonrpc":"2.0","method":"parity_newAccountFromPhrase","params":["node1", "node1"],"id":0}
EOF

cat > ouroboros-node1/passwords << EOF
node1
EOF


mkdir -p ouroboros-node2

cat > ouroboros-node2/config.toml << EOF
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
engine_signer = "0x002e28950558fbede1a9675cb113f0bd20912019"
reseal_on_txs = "none"
usd_per_tx = "0"
EOF

cat > ouroboros-node2/stakeholder_setup.json << EOF
{"jsonrpc":"2.0","method":"parity_newAccountFromPhrase","params":["node2", "node2"],"id":0}
EOF

cat > ouroboros-node2/passwords << EOF
node2
EOF


mkdir -p ouroboros-node3

cat > ouroboros-node3/config.toml << EOF
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
engine_signer = "0x00a94ac799442fb13de8302026fd03068ba6a428"
reseal_on_txs = "none"
usd_per_tx = "0"
EOF

cat > ouroboros-node3/stakeholder_setup.json << EOF
{"jsonrpc":"2.0","method":"parity_newAccountFromPhrase","params":["node3", "node3"],"id":0}
EOF

cat > ouroboros-node3/passwords << EOF
node3
EOF

