#!/bin/bash -v
wget https://apt.puppetlabs.com/puppet5-release-bionic.deb
cd /
sudo dpkg -i puppet5-release-bionic.deb
sudo apt-get update
sudo apt-get install puppetserver
sudo echo "PATH=$PATH:/opt/puppetlabs/bin/" >> .profile

sleep 1m

sudo puppet module install puppet-cassandra --version 2.7.3
