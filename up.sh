#!/usr/bin/env bash
set -e

NGROK_AUTHTOKEN=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --ngrok-token)
      if [ -z "$2" ]; then
        echo "Error: --ngrok-token requires a value"
        exit 1
      fi
      NGROK_AUTHTOKEN="$2"
      shift 2
      ;;
    *)
      echo "Unknown argument: $1"
      echo "Usage: $0 --ngrok-token <TOKEN>"
      exit 1
      ;;
  esac
done

export DOCKER_GID=$(stat -c %g /var/run/docker.sock)
export PWD=$(pwd)

if [ -z "$NGROK_AUTHTOKEN" ]; then
  docker compose up -d
  exit 1
fi

export NGROK_AUTHTOKEN

docker compose up -d
docker compose -f docker-compose.ngrok.yaml up -d
