#!/bin/bash -x

# Script that sets up puppet version 5/6 agent on nodes + Puppet version 6 puppetserver on 
# the puppetmaster vm.

hostname=$(cat /etc/hostname)

if [[ $hostname == 'puppet5' ]] 
  then
    wget https://apt.puppetlabs.com/puppet5-release-bionic.deb
    sudo dpkg -i puppet5-release-bionic.deb
elif [[ $hostname == 'puppet6' || $hostname == 'puppetmaster' ]]
  then
    wget https://apt.puppetlabs.com/puppet6-release-bionic.deb
    sudo dpkg -i puppet6-release-bionic.deb
else
  exit 1
fi

sudo apt-get update

if [[ $hostname == 'puppet5' || $hostname == 'puppet6' ]]
  then
    sudo apt-get install puppet-agent
else
  sudo apt-get install puppetserver -y
fi

sudo echo "PATH=$PATH:/opt/puppetlabs/bin/" | tee -a  ~/.profile
source ~/.profile

if [[ $hostname == 'puppetmaster' ]]
  then
   puppet module install puppet-cassandra --version 2.7.3
   
fi 
