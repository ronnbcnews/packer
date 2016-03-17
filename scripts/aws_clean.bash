#!/usr/bin/env bash
. /tmp/cleanup.inc
rm -vrf /var/lib/cloud/instances/*
find /var/lib/cloud  /var/lib/puppet/ssl -type f -o -type l -delete
find /var/log/ -type f -delete
find /var/tmp/ -type f -delete
find /var/run/ -type f -delete



