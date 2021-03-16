FROM consol/ubuntu-xfce-vnc
# https://github.com/ConSol/docker-headless-vnc-container

USER 0

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install software-properties-common \
 && add-apt-repository --yes ppa:quiterss/quiterss \
 && apt-get update \
 && apt-get -y --no-install-recommends install quiterss \
 && apt-get clean \
 && rm -rf /var/cache/apt/archives/* \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get -y install autocutsel

USER 1000

RUN mkdir -p /headless/.local/share/data/QuiteRss/QuiteRss /headless/.config/QuiteRss

CMD ["/usr/bin/quiterss"]

