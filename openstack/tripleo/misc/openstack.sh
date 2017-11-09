#!/bin/bash

CFG=local.conf

#apt-get -y install git
#apt-get install python-netaddr

yum -y install git

sudo useradd -s /bin/bash -d /opt/stack -m stack
echo "stack ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/stack


sudo su - stack << block

git clone https://git.openstack.org/openstack-dev/devstack;
cd devstack;

echo '[[local|localrc]]' > ${CFG};
echo 'HOST_IP=10.0.2.15' >> ${CFG};
echo 'ADMIN_PASSWORD=123qwe123' >> ${CFG};
echo 'DATABASE_PASSWORD=123qwe123' >> ${CFG};
echo 'RABBIT_PASSWORD=123qwe123' >> ${CFG};
echo 'SERVICE_PASSWORD=123qwe123' >> ${CFG};

#FORCE=yes 
./stack.sh

block

#curl -X POST --data-urlencode 'payload={ "channel": "#github-itraccoons", "username": "raccoon1", "text": "Openstack provisioning completed", "icon_emoji": ":ghost:" }' https://hooks.slack.com/services/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