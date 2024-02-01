FROM alpine:3.19.1

RUN adduser -D nonroot -u 1001 -h /home/nonroot
RUN apk add --no-cache aws-cli

USER 1001
WORKDIR /home/nonroot

ENTRYPOINT ["/bin/sh"]
