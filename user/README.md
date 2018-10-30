# user

Very simple, stupid module that is only for demonstration purposes.
The module creates/ modifies linux users with a username and a password.
The password is encrypted with Eyaml in data/common.yaml.

This module depends on `eyaml` to run as intended.
Please download the eyaml extension with `sudo apt install hiera-eyaml` (give a shout-out if it doesn't work).
Make sure you are in the module folder `(etc/puppetlabs/code/environments/production/modules/user)`, then create a key-pair with `eyaml createkeys`.
This should create a folder named `keys` in which the private and public keys are stored.
The private keys must change it permissions so that the puppet agent can retrieve the catalog without errors. To do this, type `chmod 0644 /etc/puppetlabs/code/environments/production/modules/user/keys/private_key.pkcs7.pem`

To run this demonstration, have a simple client/master architecture with Puppet (e.g. 1x PuppetMaster that runs puppetserver and 1x PuppetNode that runs puppet-agent).
Edit site.pp on the master to your puppet node's name (e.g. puppet5.openstacklocal), also remember to edit /etc/hosts on each machine so that the master and node can communicate without
using a DNS-server. 
Run `puppet agent -t --debug`, then inspect the debug output and notice that the encrypted password on the master is being sent as plaintext to the node.
