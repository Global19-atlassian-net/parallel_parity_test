PROJECT="{{ projectname }}"
NODES="{{ projectname }}-node{{ range(aws.nodes)|join(" " + projectname + "-node") }}"
AWS_DEFAULT_REGION={{ aws.region }}
{% if aws.type %}
AWS_INSTANCE_TYPE={{ aws.type }}
{% endif %}
PARALLEL_CONCURRENCY={{ aws.concurrency }}
PATH=$PATH:/root/.cargo/bin:/usr/local/bin
OFFSET={{ time_offset }}
PARITY_PORT={{ parity_port }}
