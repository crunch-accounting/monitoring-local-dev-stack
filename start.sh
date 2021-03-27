#!/bin/bash

command -v curl >/dev/null 2>&1 || { echo >&2 "Startup script requires \`curl\` but it's not installed. Exiting."; exit 1; }

docker-compose up -d

count=1
until [ "$(curl -s 'http://localhost:9990/graph' | grep 'Prometheus Time Series Collection and Processing Server')" ];
do
  if [ "$count" -gt 24 ]; then
      echo "Timeout waiting for Prometheus, exiting"
      exit 1
  fi

  echo "Waiting for Prometheus (#$count)..."
  count=$((count+1))
  sleep 5
done

echo 'Prometheus Metrics/Alerting & Grafana environment is up and running'
