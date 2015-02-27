# -*- mode: ruby -*-
# vi: set ft=ruby :


# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "pyranja/centos-6"
  
  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "projects", "/var/www/html", :owner=> 'apache', :group=>'apache', :mount_options => ['dmode=777', 'fmode=777']

  # Set provider
  config.vm.provider "hyperv"
  
  # Vagrant has a bug that doesn't allow us to set memory and vmname.. 
  # This can be uncommented when Vagrant is updated
  #
  # config.vm.provider "hyperv" do |hyperv|
  #   hyperv.vmname = "Bild Testing"
  #   hyperv.memory = "2048"
  #	  hyperv.cpus = "2"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", path: "provisioning/lampstack.sh"
  
  config.vm.host_name = 'bild-testing.com'
  
end
