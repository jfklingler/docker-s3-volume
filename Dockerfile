FROM philcryer/min-jessie
MAINTAINER John Klingler <jfklingler@gmail.com>

RUN apt-get update && apt-get install -y awscli
ADD watch /watch

ENTRYPOINT [ "./watch" ]
