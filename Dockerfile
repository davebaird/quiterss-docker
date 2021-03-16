FROM ubuntu:14.04
# Doesn't work on later ubuntus - I think problems with Qt and/or openssl versions

# docker build -t quiterss .

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install software-properties-common \
 && add-apt-repository --yes ppa:quiterss/quiterss \
 && apt-get update \
 && apt-get -y --no-install-recommends install quiterss \
 && apt-get clean \
 && rm -rf /var/cache/apt/archives/* \
 && rm -rf /var/lib/apt/lists/*

# RUN apt-get update && apt-get -y install sudo mesa-utils

# COPY rootfs /

RUN useradd --no-log-init --create-home --shell /bin/bash --comment "" --uid 1000 --user-group user

ENV QT_XKB_CONFIG_ROOT /usr/share/X11/xkb

USER user

RUN mkdir -p /home/user/.local/share/QuiteRss/QuiteRss /home/user/.config/QuiteRss

# ENTRYPOINT ["/entrypoint.sh"]
ENTRYPOINT ["/usr/bin/quiterss"]
