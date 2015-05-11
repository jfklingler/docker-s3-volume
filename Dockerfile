FROM philcryer/min-jessie
MAINTAINER John Klingler <jfklingler@gmail.com>

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends awscli && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/{apt,cache,dpkg,log}/ /tmp/*

ADD watch /watch

ENTRYPOINT [ "./watch" ]
