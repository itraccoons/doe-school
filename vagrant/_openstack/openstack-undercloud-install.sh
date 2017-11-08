#!/bin/bash

sudo useradd stack
echo "stack ALL=(root) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/stack
sudo chmod 0440 /etc/sudoers.d/stack

sudo su - stack << block

sudo curl -L -o /etc/yum.repos.d/delorean-pike.repo https://trunk.rdoproject.org/centos7-pike/current/delorean.repo
sudo curl -L -o /etc/yum.repos.d/delorean-deps-pike.repo https://trunk.rdoproject.org/centos7-pike/delorean-deps.repo
sudo yum -y install yum-plugin-priorities
sudo yum -y install python-tripleoclient
#cp /usr/share/instack-undercloud/undercloud.conf.sample ~/undercloud.conf
cp /vagrant/vagrant-undercloud.conf ~/undercloud.conf
#openstack undercloud install

block