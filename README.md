# Bitcoind-Python
In this guide you will learn how to run a bitcoind-node using Docker and how to interact with it using the Python RPC interface.

## Running Docker
First, ensure that you are running Docker. There are great instructions for getting this set up in your environment [here](https://www.docker.com/). To test that Docker is running in your environment try running:

```
docker ps
```

If Docker is running you should see the following. Note that if you have containers running they will be listed below.

```
CONTAINER ID        IMAGE               COMMAND             CREATED
```

## Running Bitcoind
Bitcoind is a program that implements the Bitcoin protocol for remote procedure call (RPC) use. It is a headless daemon which, on starting, tries to download the latest copy of the Bitcoin blockchain. This can take a **long time** and a **lot of space**. At the time of writing the blockchain is 144GB in size. While the blockchain is downloading you may still interact with bitcoind. So, if you'd like to use this guide to run a bitcoind node locally you can still do this, but you probably don't want to store the entire blockchain on your laptop. We're going to use a version of bitcoind packaged into a Docker container by [Kyle Manna](kylemanna.com). You can find his [repo here](https://github.com/kylemanna/docker-bitcoind).

So, let's turn this thing on! There is a shell script called `docker_run.sh` in this repository. This file runs the Docker container and sets the `bitcoin.conf` file to be used as the one in this repository. Note that if you wish to change the RPC user and password you should change the following lines in the `bitcoin.conf` file in this repo:

```
rpcuser=rpcuser
rpcpassword=rpcsecret
```

For testing we can just use the defaults and run:

```
bash docker_run.sh
```

This will launch a bitcoind node as a Docker container called `bitcoind-node`. You can verify this by running `docker ps` again. You should see the container listed. You can also check the container logs with `docker logs bitcoind-node`. You'll likely see it downloading the blockchain, block by block. This looks something like:

```
UpdateTip: new best=00000000000000893fb611123d12e6c8029cf218a3aa04a7053f7cebe9853889 height=181392 version=0x00000001 log2_work=68.174848 tx=3415609 date='2012-05-24 09:37:20' progress=0.012319 cache=9.1MiB(66336txo)
```

You can see the node's `progress` getting caught up with the latest blocks as well as the node's blockchain tip (the latest block downloaded) is. In this case the node has reached block `181392`. You can learn more about this block at [blockchain.info](https://blockchain.info/block-index/241103/00000000000000893fb611123d12e6c8029cf218a3aa04a7053f7cebe9853889).

## Python RPC to bitcoind
Now you're ready to interact with bitcoind using Python. First, make sure you've installed the Python Bitcoin RPC client. You can do this with:

```
pip install python-bitcoinrpc
```

You'll also need Jupyter installed:

```
pip install jupyter
```

*Aside: I recommend using a `virtualenv` or `conda` to set up the Python environment.*

Now, you can run the Jupter Notebook server with:

```
jupyter notebook
```

In your browser navigate to `localhost:8888` and open up `bitcoind-python.ipynb`.





