#!/usr/bin/env bash
rm -vf /etc/udev/rules.d/70-persistent-net.rules
rm -vf /etc/ssh/*_key
rm -vf /etc/ssh/*.pub
rm -vrf /var/lib/puppet/reports/*
