# Docker Container for DNSmasq

This project is for running a DNSmasq inside docker to spawn your own DNS Server for creating custom URLs at home or in other private networks.

## Installation

Just pull the container from dockerhub with `docker pull m3philis/dnsmasq`.

## Usage

DNSmasq gets configured via environment variables

* `DNSMASQ_FORWARD` to specify the first DNS Server which is asked when DNSmasq can't resolve a request, other DNS forward server are found in `/etc/resolv.conf`
* `DNSMASQ_RULES` to specify DNS entries to add to DNSmasq in one line. Syntax is `a.test.com=1.2.3.4,b.test.com=1.2.3.5`
* `DNSMASQ_RULES_FILE` to specify a file for host entries.


### docker

Start the container with `docker run -p 53:53/udp -e DNSMASQ_FORWARD=1.1.1.1 -e DNSMASQ_RULES="a.test.com=1.2.3.4,b.test.com=1.2.3.5" m3philis/dnsmasq`


### docker-compose

Simple docker-compose.yaml example:

```
   version: '3.6'

   services:
     dnsmasq:
       image: m3philis/dnsmasq
       ports:
       - 53:53/udp
       environment:
       - DNSMASQ_FORWARD: 1.1.1.1
       - DNSMASQ_RULES: "a.test.com=1.2.3.4,b.test.com=1.2.3.5"
```
