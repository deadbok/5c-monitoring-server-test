Vagrant.configure("2") do |config|
    config.vm.box = "debian/stretch64"
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.manage_guest = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true

    config.vm.define :monitor_vm do |monitor_vm|
        monitor_vm.vm.hostname = "monitor-vm"
        #monitor_vm.vm.network "private_network", ip: "192.168.50.11"
        monitor_vm.vm.network "private_network", ip: "fd80:0:3::11"
        monitor_vm.vm.network :forwarded_port, guest: 22, host: 2251, id: 'ssh'

        monitor_vm.vm.provider "virtualbox" do |vb|
            vb.name = "monitor_vm"
            vb.cpus = 2
            vb.memory = 4096
        end
    end

    config.vm.define :dummy_vm do |dummy_vm|
        dummy_vm.vm.hostname = "dummy-vm"
        #dummy_vm.vm.network "private_network", ip: "192.168.50.12"
        dummy_vm.vm.network "private_network", ip: "fd80:0:3::12"
        dummy_vm.vm.network :forwarded_port, guest: 22, host: 2252, id: 'ssh'

        dummy_vm.vm.provider "virtualbox" do |vb|
            vb.name = "dummy_vm"
            vb.cpus = 1
            vb.memory = 512
        end
    end

    config.vm.define :dummier_vm do |dummier_vm|
        dummier_vm.vm.hostname = "dummier-vm"
        #dummier_vm.vm.network "private_network", ip: "192.168.50.13"
        dummier_vm.vm.network "private_network", ip: "fd80:0:3::13"
        dummier_vm.vm.network :forwarded_port, guest: 22, host: 2253, id: 'ssh'

        dummier_vm.vm.provider "virtualbox" do |vb|
            vb.name = "dummier_vm"
            vb.cpus = 1
            vb.memory = 512
        end
    end

    config.vm.define :desktop_vm do |desktop_vm|
        desktop_vm.vm.hostname = "desktop-vm"
        #desktop_vm.vm.network "private_network", ip: "192.168.50.14"
        desktop_vm.vm.network "private_network", ip: "fd80:0:3::14"
        desktop_vm.vm.network :forwarded_port, guest: 22, host: 2254, id: 'ssh'
        desktop_vm.vm.box = "xnerv/desktop-debian-8-amd64.box"
        desktop_vm.vm.box_version = "1.0.0"

        desktop_vm.vm.provider "virtualbox" do |vb|
            vb.name = "desktop_vm"
            vb.cpus = 1
            vb.memory = 1024
        end
    end

    #config.vm.provision :ansible do |ansible|
    #    ansible.playbook = "playbook.yml"
    #    ansible.verbose = "v"
    #    ansible.groups = {
    #        "servers" => ["monitor_vm"],
    #        "clients" => ["dummy_vm", "dummier_vm"]
    #    }
    #    ansible.host_vars = {
    #        "monitor-vm" => {
    #            "elastic_backend_host" => "192.168.50.11",
    #        }
    #    }
    #end
end
