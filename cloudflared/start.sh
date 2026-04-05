#!/bin/sh
set -eu

mkdir -p /data
: > /data/cloudflared.log
: > /tunnel-data/tunnel_url

/usr/local/bin/cloudflared tunnel --no-autoupdate --url http://haproxy:80 2>&1 | tee -a /data/cloudflared.log | awk '
  match($0, /https:\/\/[a-z0-9-]+\.trycloudflare\.com/) {
    url=substr($0, RSTART, RLENGTH);
    print url > "/tunnel-data/tunnel_url";
    fflush("/tunnel-data/tunnel_url");
  }
  { print }
'
