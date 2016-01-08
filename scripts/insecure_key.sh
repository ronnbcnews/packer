#!/usr/bin/env bash

mkdir ~vagrant/.ssh
chown vagrant. ~vagrant/.ssh
chmod 700 ~vagrant/.ssh
cd ~vagrant/.ssh
wget -O authorized_keys -k https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub
chmod 600 authorized_keys && chown vagrant. ~vagrant/.ssh/authorized_keys

# Disable password auth. SSH logon is via ssh key only. A password is being set
# for root via the image manifest per IMAGE-459.
# echo "Disabling password auth in sshd_config"
sed s/PasswordAuthentication\ yes/PasswordAuthentication\ no/ -i /etc/ssh/sshd_config
