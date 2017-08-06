
  
Set up the Runner, this is the main C&C node:

    docker build -t runner .

Enter (first time):

    docker run --name runner -it runner bash

Subsequent:

    docker start runner
    docker exec -it runner bash

Build Parity:

    cd runner/
    ./build_parity.sh

Set the parameters for the test:

    vi default.yml
    
Choose number of nodes (and change any other parameters):

    aws:
      concurrency: 4
      nodes: 4

`concurrency` is the number of nodes to execute commands against at once, `nodes` is the total number of nodes.

Create the nodes:

    export AWS_ACCESS_KEY_ID=...
    export AWS_SECRET_ACCESS_KEY=...
    ./update.sh
    ./create_instances.sh
    
> Sometimes Docker Machine doesn't successfully create valid certificates, if there are any issues, terminate the instances using `./terminate_instances.sh`, exit the container, remove it `docker rm -f runner` and start again.

Run the test:

    ./deploy.sh
    
Monitor if the tests are finished:

    ./logs 0 --tail=100
    
Retrieve the results:

    ./analyze.sh
    
From the host node you can then copy the results from the runner:

    docker cp runner:/working/runner/analysis.csv .         
    
        


