#!/bin/bash -v
wget https://apt.puppetlabs.com/puppet5-release-bionic.deb
sudo dpkg -i puppet5-release-bionic.deb
apt-get update
apt-get install puppet-agent
echo "PATH=$PATH:/opt/puppetlabs/bin/" >> .profile

sleep 1m

puppet module install puppet-cassandra --version 2.7.3
