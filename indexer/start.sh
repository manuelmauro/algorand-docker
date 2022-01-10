#!/usr/bin/env bash

./algorand-indexer daemon -P "host=[your-host] port=[your-port] user=[uname] password=[password] dbname=[ledgerdb] sslmode=disable" --algod-net="http://[your-host]:[your-port]" ---algod-token="[your-api-token]
