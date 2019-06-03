FROM alpine:3.9
MAINTAINER Philipp Hellmich <phil@hellmi.de>

ARG VERSION=0.2.6

RUN cd /tmp && \
    wget https://github.com/dalance/prosafe_exporter/releases/download/v$VERSION/prosafe_exporter-v$VERSION-x86_64-lnx.zip -O /tmp/exporter.zip && \
    unzip /tmp/exporter.zip && \
    chmod 755 /tmp/prosafe_exporter && \
    mv /tmp/prosafe_exporter /usr/local/bin && \
    rm /tmp/exporter.zip

RUN apk add --no-cache tini

USER nobody

ENTRYPOINT ["/sbin/tini"]

CMD [ "prosafe_exporter"]
