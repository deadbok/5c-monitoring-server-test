# Monitoring server test

Test and example of using the monitoring server Ansible roles written
for the "Five Countries" project at EAL Odense in the fall of 2017.

The test uses Vagrant to bring up 4 virtual machines for testing. One acting as
the monitoring server, two acting as clients, and 1 desktop machine used to see
the marvels of the server in action. This is an example of using Ansible, the
roles, and the inventory, therefore Vagrant is not used for provisioning, and
the inventory is static. Any changes made to the network configuration in the
Vagrantfile, will have to be manually carried over to the inventory.

## Usage

Install the [Vagrant host updater](https://github.com/cogitatio/vagrant-hostsupdater)
plugin and the [Vagrant host manager](https://github.com/devopsgroup-io/vagrant-hostmanager).

    vagrant plugin install vagrant-hostsupdater
    vagrant plugin install vagrant-hostmanager

Run Vagrant to create the virtual machines.

    vagrant up

Run the Ansible play book using the inventory in `inventory/hosts` to deploy the
test machines.

    vagrant up
    ansible-playbook -i inventory/hosts playbook.yml

After this is done, the simplest way to access the monitoring server is through
the `desktop_vm` machine in Virtual Box. The monitoring services are accessible
at the following URLs:

 * `http://[fd80:0:3::11]`: LibreNMS (user: *admin*, password: *changeme*)
 * `http://[fd80:0:3::11]:5601`: Kibana.

## Files

  * *inventory/\**: The inventory where host, groups and variables for both are
    defined.
      * *group_vars*: Variables by group.
          * *monitor*: Variables specific to the monitoring server.
          * *vagrant*: Variables specific to vagrant VMs.
          * *all.yml*: Variables for all machines in the inventory.
      * *host_vars*: Variables by host.
          * *desktop.vm*: Variables specific to the desktop VM.
              * *ssh.yml*: SSH port and private key used to connect to the VM.
          * etc...
      * *hosts*: The inventory file.
  * *roles/\**: Roles used in the playbook.
      * *ansible-integrated-elks*: Role to install the elastic stack .
      * *ansible-librenms*: Role to install LibreNMS.
      * *rsyslog-debian*: Role to set up rsyslog to relay logs to the elastic
        stack.
  * *deploy.sh*: Run Vagrant and Ansible to deploy the machines.
  * *destroy.sh*: Destroy the machines.
  * *halt.sh*: Shut down the machines.
  * *playbook.yml*: Main Ansible playbook.
  * *Vagrantfile*: Vagrant file to create the test VMs.

## The play book

The play book tasks:

    * Deploy a monitoring server to every host in the monitor group.
    * Set up snmpd on all hosts in the snmpd group.
    * Set up rsyslog for sending to the monitoring server on all hosts in the
      clients group.
    * Set up some tools on the hosts in the clients group.

## Outstanding issues

 * The rsyslog -> logstash pipeline needs attention
 * LibreNMS autodiscovery needs attention
 * Kibana login.
