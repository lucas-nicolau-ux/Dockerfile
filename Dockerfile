FROM docker.n8n.io/n8nio/n8n:latest-debian

USER root

RUN set -eux; \
  . /etc/os-release; \
  if [ "${VERSION_CODENAME:-}" = "buster" ]; then \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid; \
    printf "deb http://archive.debian.org/debian buster main contrib non-free\n" > /etc/apt/sources.list; \
  fi; \
  apt-get update; \
  apt-get install -y --no-install-recommends ffmpeg; \
  apt-get clean; \
  rm -rf /var/lib/apt/lists/*

USER node
