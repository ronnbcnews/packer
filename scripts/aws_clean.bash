#!/usr/bin/env bash

rm -vf /etc/udev/rules.d/70-persistent-net.rules
rm -vf /etc/ssh/*_key
rm -vf /etc/ssh/*.pub
rm -vrf /var/lib/puppet/reports/*
rm -vrf /tmp/*
rm -vrf /var/lib/cloud/instances/*
find /var/lib/cloud  /var/lib/puppet/ssl -type f -o -type l -delete
find /var/log/ -type f -delete
find /var/tmp/ -type f -delete
find /var/run/ -type f -delete
find /var/lib/dhclient -type f -exec rm -f '{}' +
