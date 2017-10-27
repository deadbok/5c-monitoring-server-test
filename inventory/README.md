# Inventory

Host are defined and grouped in `hosts`, the directories `group_vars` and
`host_vars` contains variable definitions for specific groups and hosts.

## Hosts and groups

### Groups

    * *monitor*: Every host that should act as a monitoring server.
    * *clients*: Every host not a monitoring server.
    * *vagrant*: Every host that has been created by vagrant.
    * *snmp*: Every host that uses SNMP (including the monitoring server)
    * *snmpd*: Every host that is supposed to run SNMPd for communicating
      with the monitoring server.

### Hosts

 * *monitor-vm*: Monitoring server.
 * *dummy-vm*: Unused example machine.
 * *dummier-vm*: Unused example machine.
 * *desktop-vm*: Desktop machine to access the monitoring server.

## Group variables

 * *monitor*: Variables for the monitoring server.
     * Set IP addresses for externally accessible services.
     * Set network on which LibreNMS does autodiscovery.
 * *snmp*: Variables for SNMP used by both clients and the monitoring server.
     * Set SNMP community string.
     * Set SNMP admin user info and location.
 * *vagrant*: Variables for all Vagrant VMs.
     * Set up SSH connection details for Vagrant VMs.
 * *all.yml*: Variables that applies to all groups.
     * Set the IP address of the monitoring VM.

## Host variables

For illustrative purposes this example does not use Vagrant to provision the
VMs using Ansible. This is to make the example act more like a situation where
the machines were created by other means.

Because the VMs are accessed outside Vagrant, a connection using Vagrant SSH key
has to be established. Therefore each VM has a `ssh.yml` file defining the
path to the key, and the port on which SSH is listening. These files are each
in their own directory to show that it is possible. In this simple case the
variables might as well have been defined in their own files in the host_vars
directory itself (for instance `host-vars/desktop-vm.yml`).
