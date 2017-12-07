#!/bin/bash

CONF="/bitcoin.conf"
CUR_DIR=$(PWD)
BTC_CONF=$CUR_DIR$CONF
ECHO "Using conf from $BTC_CONF"

docker run -v bitcoind-data:/bitcoin --name=bitcoind-node -d \
        -p 8333:8333 \
        -p 127.0.0.1:8332:8332 \
        -v "$BTC_CONF":/bitcoin/.bitcoin/bitcoin.conf \
        kylemanna/bitcoind
