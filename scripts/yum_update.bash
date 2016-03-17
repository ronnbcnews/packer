#!/usr/bin/env bash
 - cloud-init-per once katelloCACerts rpm  -ihv http://newa1katcadmz01.west.nbcnd.aws/pub/katello-ca-consumer-latest.noarch.rpm
 - cloud-init-per once subscriptionManagerReg subscription-manager register --name=newsa1mpxgo01.west.nbcnd.aws --org="NBCND" --activationkey="Production_7_2-UHJvZHVjdGlvbl83XzItCg" --force
 - cloud-init-per once subscriptionManagerConfig subscription-manager config --rhsm.baseurl="https://newa1katdmz01.west.nbcnd.aws/pulp/repos"
 - cloud-init-per always yumUpgrade yum -y upgrade