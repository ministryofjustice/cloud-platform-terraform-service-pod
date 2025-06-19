FROM debian:12.11-slim

RUN useradd -m -u 1001 -d /home/nonroot nonroot
RUN apt-get update && apt-get install -y awscli curl less && rm -rf /var/lib/apt/lists/*

USER 1001
WORKDIR /home/nonroot

ENTRYPOINT ["/bin/sh"]