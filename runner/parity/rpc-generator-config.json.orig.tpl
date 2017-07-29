{
  "generator": "random",
  "count": 100000,
  "chunk-size": 1000,
  "accounts": [
{% for n in range(aws.nodes) %}    
    {
      "id": "{{ node_list[n] }}",
      "balance": "1000000",
      "password": "node{{ n }}"
    },
{% endfor %}    
  ]
}
