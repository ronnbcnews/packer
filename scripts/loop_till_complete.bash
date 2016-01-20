#!/usr/bin/env bash

SYSIMAGE="/mnt/sysimage"
until test -f ${SYSIMAGE}/tmp/packer_i_am_done
do
sleep 2
done
