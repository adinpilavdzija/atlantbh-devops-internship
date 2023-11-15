#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Please provide at least 1 argument!"
  exit 1
fi

for domain in "$@"; do
  result="$(dig "$domain")"

  resolution_time="$(echo "$result" | grep "Query time:" | awk '{print $4}')"
  echo "DNS resolution time for $domain: ${resolution_time}ms"
done
