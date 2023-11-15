#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Please provide exactly 1 argument!"
    exit 1
fi

latency="$(curl --silent -w "Latency for '$1' is %{time_total} seconds" "$1")"

echo "$latency"