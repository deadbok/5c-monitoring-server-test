# Inventory

Host are defined and grouped in `hosts`, the directories `group_vars` and
`host_vars` contains variable definitions for specific groups and hosts.

## Group variables

 * *monitor*: Variables for the monitoring server.
     * Set IP addresses for externally accessible services.
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
