FROM alpine:latest
MAINTAINER janthomae@janthomae.de

RUN apk add --update socat

ENV LISTEN_PROTO=TCP4 \
    LISTEN_PORT=8888 \
    TARGET_PROTO=TCP4 \
    TARGET_HOST=example.com \
    TARGET_PORT=9999

CMD socat $LISTEN_PROTO-LISTEN:$LISTEN_PORT,fork,su=nobody $TARGET_PROTO:$TARGET_HOST:$TARGET_PORT

USER 1001