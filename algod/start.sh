#!/usr/bin/env bash

goal node start && tail -f ${ALGORAND_DATA}/node.log
