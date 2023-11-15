#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Please provide at least 1 argument!"
    exit 1
fi

for website in "$@"; do
    if curl --silent --head --fail "$website"; then
        echo "$website is UP"
    else
        echo "$website is DOWN"
    fi
done

