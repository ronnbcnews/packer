#!/usr/bin/env bash
rm -f /etc/udev/rules.d/70-persistent-net.rules
rm -vf /etc/ssh/*_key
rm -vf /etc/ssh/*.pub
rm -vrf /var/lib/puppet/reports/*
rm -vrf /tmp/*
