#!/usr/bin/env bash
set -e

WITH_CLOUD_TUNNEL=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --with-cloud-tunnel)
      WITH_CLOUD_TUNNEL=true
      shift
      ;;
    *)
      echo "Unknown argument: $1"
      echo "Usage: $0 [--with-cloud-tunnel]"
      exit 1
      ;;
  esac
done

export DOCKER_GID=$(stat -c %g /var/run/docker.sock)
export PWD=$(pwd)

if [ "$WITH_CLOUD_TUNNEL" = true ]; then
  docker compose -f docker-compose.yml -f docker-compose.cloud.yaml up -d
else
  docker compose up -d
fi
