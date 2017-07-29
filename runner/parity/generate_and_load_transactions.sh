/parity-setup/target/release/parity-rpc-generator --config rpc-generator-config.json --seed $RANDSEED --output /tmp/par

for i in /tmp/par*
do 
  echo $i
  curl --data @${i} -H "Content-Type: application/json" -X POST localhost:8540
done