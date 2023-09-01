FROM alpine:3.18.3

RUN adduser -D nonroot -u 1001
RUN apk add --no-cache aws-cli

USER 1001

ENTRYPOINT ["/bin/sh"]
