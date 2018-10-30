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

sudo echo "PATH=$PATH:/opt/puppetlabs/bin/" >>  /root/.bashrc
source /root/.bashrc

if [[ $hostname == 'puppetmaster' ]]
  then
   puppet module install puppet-cassandra --version 2.7.3
fi

if [[ $hostname == 'puppetmaster' ]]
	then
	sudo service puppetserver start
	sudo iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 8140 -j ACCEPT
fi
