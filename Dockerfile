FROM alpine

ENV DNSMASQ_FORWARD 1.1.1.1

RUN apk update && \
    apk add dnsmasq

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["dnsmasq", "-d"]
