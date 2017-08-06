## Introduction

Use this project to build, run and analyze Ouroboros.

This test suite is build around AWS and Docker. The central coordination node (`runner`) includes all necessary dependencies to run the rest of the tests. In order to get started at least one Docker node should be available. This can be a local Docker instance or remote.

## Build The Test Runner
  
Set up the Runner, this is the main C&C node:

    docker build -t runner .

Enter the `runner` instance for the first time:

    docker run --name runner -it runner bash

> If you accidentally exit this process the `runner` instance, use the procedure below to enter it again.

    docker start runner
    docker exec -it runner bash

## Build Ouroboros

The first step is to build the actual binary which will be output to `runner/parity/out`.

    cd runner/
    ./build_parity.sh

Set the parameters for the test:

    vi default.yml
    
Choose number of nodes (and change any other parameters):

    aws:
      concurrency: 4
      nodes: 4

`concurrency` is the number of nodes to execute commands against at once, `nodes` is the total number of nodes.

## Create The Worker Nodes

The test suite uses AWS, you will need an `access key` and a `secret access key` in order to instantiate the test nodes.

Create the nodes (set the environment):

    export AWS_ACCESS_KEY_ID=...
    export AWS_SECRET_ACCESS_KEY=...
    
Create all project templates using the `update.sh` script and then use the `create_instances.sh` script. Instances will use the `project` key in `default.yml` to determine names and will be named `ouroboros-nodeX` according to the number of `aws.nodes` requested. You can view these by running `docker-machine ls` in the `runner` (`docker-machine` is bundled).
    
    ./update.sh
    ./create_instances.sh
    
> Sometimes Docker Machine doesn't successfully create valid certificates, if there are any issues, terminate the instances using `./terminate_instances.sh`, exit the container, remove it `docker rm -f runner` and start again.

## Run The Distributed Test

Run the test by executing:

    ./deploy.sh
    
This is a simple 'orchestration' script that in turn runs 6 sub-steps:

-  `deploy_1_build_and_clear.sh` builds the `ouroboros` images and clears out old images on the worker nodes. There is one image per worker node.

- `deploy_2_run_initialise.sh` creates an initial container on each of the nodes.

- `deploy_3_configure_users.sh` creates test users for each instance.

- `deploy_4_production_mode.sh` restarts all the containers using production settings.

- `deploy_5_notify_nodes.sh` notifies all nodes (in a round-robin fashion) of each other.

- `deploy_6_transactions.sh` creates test transactions for the nodes.
    
    
Monitor if the tests are finished:

    ./logs 0 --tail=100
    
## Analyze The Results
    
Retrieve the results using:

    ./analyze.sh
    
From the host node you can then copy the results from the runner:

    docker cp runner:/working/runner/analysis.csv .         
    
        


