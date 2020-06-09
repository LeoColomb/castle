#!/bin/sh

docker run -d \
  -p 80:80 \
  -p 443:443 \
  -v "/var/run/docker.sock:/var/run/docker.sock" \
  -v "${PWD}/configs:/opt/castle" \
  -l "traefik.http.services.castle.loadBalancer.server.port=8080" \
  -l "traefik.http.routers.castle.tls=true"
  traefik:latest --configFile=/opt/castle/traefik.toml
