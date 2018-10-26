## Under development
## Instructions for setting up the stack containing 1 puppetserver and 2 puppet-agent nodes
    Project relies on having access to Skyhigh openstack.

### Change the file project_env.yaml
    replace martbraa.pem with your own key in key_name

### Make new stack with command
    openstack stack create -t make_new_vms_project.yaml -e project_env.yaml project

## SSH into puppetmaster
    ssh -i <keyname> ubuntu@ <ip-address of puppetmaster>

### Open and edit the file 
    /etc/hosts
#### Should look like
    127.0.0.1 localhost
    <IP-address of PuppetMaster> PuppetMaster.openstacklocal
    <IP-address of Puppet5> Puppet5.openstacklocal
    <IP-address of Puppet6> Puppet6.openstacklocal

### Make sure puppet is installed and put in PATH
    puppet --version
    find /opt/puppetlabs/bin/puppet
#### If Puppet is installed but not put in path
    echo PATH=$PATH:/opt/puppetlabs/bin/ -> /root/.profile
    source /root/.profile
### Start the puppetserver and open port 8140 for communication
    sudo service puppetserver start
    sudo iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 8140 -j ACCEPT

