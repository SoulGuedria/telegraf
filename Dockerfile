FROM nvidia/cuda

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends iputils-ping snmp procps && \
    rm -rf /var/lib/apt/lists/*

RUN set -ex && \
    for key in \
        05CE15085FC09D18E99EFB22684A14CF2582E0C5 ; \
    do \
        gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || \
        gpg --keyserver pgp.mit.edu --recv-keys "$key" || \
        gpg --keyserver keyserver.pgp.com --recv-keys "$key" ; \
    done

ENV TELEGRAF_VERSION 1.6.2

COPY ./telegraf /usr/bin/telegraf

EXPOSE 8125/udp 8092/udp 8094

COPY entrypoint.sh /entrypoint.sh
COPY nvidia-smi /usr/bin/nvidia-smi
ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"]
