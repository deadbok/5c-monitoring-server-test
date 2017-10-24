# Monitoring server test

Test and example of using the monitoring server Ansible roles written
for the "Five Countries" project at EAL Odense in the fall of 2017.

The test uses Vagrant to bring up 3 virtual machines for testing. One acting as
the monitoring server, and to acting as clients. This is an example of using
Ansible, the roles including and the inventory, therefore Vagrant is not usud
for provisioning, and the invent is static. Any changes made to the network
configuration in the Vagrantfile, will have to be manually carried over to the
inventory.

*The scripts are tested using on Debian using [libvirt][b4336ff7] as provider
for Vagrant.*

  [b4336ff7]: https://github.com/vagrant-libvirt/vagrant-libvirt "vagrant-libvirt"

## Usage

    vagrant up
    ansible-playbook -i inventory/hosts playbook.yml

## Files
