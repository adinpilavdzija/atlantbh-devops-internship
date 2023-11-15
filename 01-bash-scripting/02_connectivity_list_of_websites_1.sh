#!/bin/bash

websites=(
    "https://www.klix.ba"
    "https://www.google.com"
    "https://www.facebook.com"
    "https://www.sportsport.ba"
    "https://www.laznastranica.ba"
)

for website in "${websites[@]}"; do
    if curl --silent --head --fail "$website"; then
        echo "$website is UP"
    else
        echo "$website is DOWN"
    fi
done
