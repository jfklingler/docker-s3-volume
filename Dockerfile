FROM philcryer/min-jessie
MAINTAINER John Klingler <jfklingler@gmail.com>

RUN apt-get update && \
    apt-get install -y awscli && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/{apt,cache,dpkg,log}/ /tmp/*

ADD watch /watch

ENTRYPOINT [ "./watch" ]
