#!/bin/bash

domains=(
    "klix.ba"
    "google.com"
    "facebook.com"
    )

for domain in "${domains[@]}"; do
  result="$(dig "$domain")"

  resolution_time="$(echo "$result" | grep "Query time:" | awk '{print $4}')"
  echo "DNS resolution time for $domain: ${resolution_time}ms"
done