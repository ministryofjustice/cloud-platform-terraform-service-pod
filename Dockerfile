FROM alpine:3.20.3

RUN adduser -D nonroot -u 1001 -h /home/nonroot
RUN apk add --no-cache aws-cli
RUN apk add --no-cache curl

USER 1001
WORKDIR /home/nonroot

ENTRYPOINT ["/bin/sh"]
