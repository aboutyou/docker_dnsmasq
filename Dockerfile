FROM alpine

ENV DNSMASQ_FORWARD 1.1.1.1

RUN apk update && \
    apk add dnsmasq

ADD run.sh /run.sh

ENTRYPOINT ["/run.sh"]
CMD ["dnsmasq", "-d"]
