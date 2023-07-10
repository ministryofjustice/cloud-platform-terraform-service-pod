FROM alpine:3.18.2

RUN apk add --no-cache aws-cli

USER 1000

ENTRYPOINT ["/bin/sh"]
