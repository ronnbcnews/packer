#!/usr/bin/env bash
#katelloCACerts
rpm  -ihv http://newa1katcadmz01.west.nbcnd.aws/pub/katello-ca-consumer-latest.noarch.rpm
#subscriptionManagerReg
subscription-manager register --name=$(hostname -f ) --org="NBCND" --activationkey="Production_7_2-UHJvZHVjdGlvbl83XzItCg" --force
#subscriptionManagerConfig
subscription-manager config --rhsm.baseurl="https://newa1katdmz01.west.nbcnd.aws/pulp/repos"
#yumUpgrade
yum -y upgrade
#unregister from subscription manager
subscription-manager unregister