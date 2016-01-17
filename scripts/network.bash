#!/usr/bin/env bash

sed -i s#PEERDNS=no#PEERDNS=yes#g /etc/sysconfig/network-scripts/ifcfg-eth0
sed -i s#PEERROUTES=no#PEERROUTES=yes#g /etc/sysconfig/network-scripts/ifcfg-eth0
