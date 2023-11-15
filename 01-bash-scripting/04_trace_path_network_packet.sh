#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Please provide exactly 1 argument!"
    exit 1
fi

traceroute "$1"