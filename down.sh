#!/usr/bin/env bash
set -e

export DOCKER_GID=$(stat -c %g /var/run/docker.sock)
export PWD=$(pwd)

docker compose -f docker-compose.ngrok.yaml down
docker compose down
