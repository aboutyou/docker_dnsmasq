#! /bin/sh

set -ex

if [ ! -z $DNSMASQ_RULES ]
then
  IFS='\n'
  for entry in $(echo $DNSMASQ_RULES | tr '=' ' ' | tr ',' '\n')
  do
    echo $entry >> /etc/dnsmasq.d/hosts.conf
  done

  echo "addn-hosts=/etc/dnsmasq.d/hosts.conf" >> /etc/dnsmasq.conf
fi

if [ ! -z $DNSMASQ_RULES_FILE ]
then
  echo "addn-hosts=${DNSMASQ_RULES_FILE}" >> /etc/dnsmasq.conf
fi

echo "server=${DNSMASQ_FORWARD}" >> /etc/dnsmasq.conf

exec "$@"
