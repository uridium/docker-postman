FROM debian:stable-slim

ENV DEBIAN_FRONTEND noninteractive

ARG UID=1000
ARG GID=1000

RUN apt-get update -qq \
    && apt-get dist-upgrade -y -qq \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        libasound2 \
        libgconf-2-4 \
        libgtk-3-0 \
        libnss3 \
        libx11-xcb1 \
        libxss1 \
        libxtst6 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

RUN curl -sL http://dl.pstmn.io/download/latest/linux64 \
    | tar -xz -C /usr/local

RUN groupadd -g $UID postman \
    && useradd -m -u $UID -g postman postman

USER postman

ENTRYPOINT ["/usr/local/Postman/Postman"]
