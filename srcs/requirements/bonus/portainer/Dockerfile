FROM alpine:3.16

RUN apk update && apk add --no-cache tar apache2-utils

COPY /tools/setup_portainer.sh .

RUN chmod +x setup_portainer.sh

RUN mkdir -p /data/bin && mkdir -p /data/data

WORKDIR /data/

CMD sh -c "/setup_portainer.sh"

