#!/bin/bash

# CFG=local.conf

# apt-get -y update
# apt-get -y dist-upgrade
# apt-get -y install aptitude build-essential git ntp ntpdate openssh-server python-dev sudo
# apt-get -y install git

sudo useradd -s /bin/bash -d /opt/osa -m osa
echo "osa ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/osa

sudo su - osa << block
git clone -b stable/pike https://git.openstack.org/openstack/openstack-ansible /opt/osa/openstack-ansible
#./scripts/bootstrap-ansible.sh

block
