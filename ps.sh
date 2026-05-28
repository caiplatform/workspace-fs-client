#!/usr/bin/env bash
set -e

case "$(uname -s)" in
  Darwin)
    DOCKER_SOCK="${DOCKER_SOCK:-$HOME/.docker/run/docker.sock}"
    STAT_GID_CMD=(stat -f %g)
    ;;
  *)
    DOCKER_SOCK="${DOCKER_SOCK:-/var/run/docker.sock}"
    STAT_GID_CMD=(stat -c %g)
    ;;
esac

if [ ! -S "$DOCKER_SOCK" ]; then
  echo "Docker socket not found or is not a socket: $DOCKER_SOCK" >&2
  exit 1
fi

export DOCKER_GID="$("${STAT_GID_CMD[@]}" "$DOCKER_SOCK")"
export PWD="$(pwd)"


if docker compose version >/dev/null 2>&1; then
  DOCKER_COMPOSE="docker compose"
elif command -v docker-compose >/dev/null 2>&1; then
  DOCKER_COMPOSE="docker-compose"
else
  echo "Neither 'docker compose' nor 'docker-compose' is available" >&2
  exit 1
fi

$DOCKER_COMPOSE ps
