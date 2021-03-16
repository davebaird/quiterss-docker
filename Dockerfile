FROM consol/ubuntu-xfce-vnc
# https://github.com/ConSol/docker-headless-vnc-container

# docker build -t quiterss .

# docker run -it --rm -p 5999:5901 quiterss bash

USER 0

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install software-properties-common \
 && add-apt-repository --yes ppa:quiterss/quiterss \
 && apt-get update \
 && apt-get -y --no-install-recommends install quiterss \
 && apt-get clean \
 && rm -rf /var/cache/apt/archives/* \
 && rm -rf /var/lib/apt/lists/*

# RUN apt-get update && apt-get -y install sudo

# COPY rootfs /

# RUN useradd --no-log-init --create-home --shell /bin/bash --comment "" --uid 1000 --user-group user \
#  && echo 'user ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER 1000

RUN mkdir -p /headless/.local/share/data/QuiteRss/QuiteRss /headless/.config/QuiteRss

CMD ["/usr/bin/quiterss"]

