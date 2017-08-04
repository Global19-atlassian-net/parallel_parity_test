export PROJECT="{{ projectname }}"
export NODES="{{ projectname }}-node{{ range(aws.nodes)|join(" " + projectname + "-node") }}"
export AWS_DEFAULT_REGION={{ aws.region }}
{% if aws.type %}
export AWS_INSTANCE_TYPE={{ aws.type }}
{% endif %}
{% if aws.vpc %}
export AWS_VPC_ID={{ aws.vpc }}
{% endif %}
export PARALLEL_CONCURRENCY={{ aws.concurrency }}
export PATH=$PATH:/root/.cargo/bin:/usr/local/bin
export PARITY_PORT={{ parity_port }}
export RANDSEED={{ rand_seed }}
export TRANSACTIONS={{ transactions }}
export CHUNKS={{ chunks }}
export RUSTVER={{ rust_ver }}
