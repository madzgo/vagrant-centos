# CentOS - Local development environment with Vagrant and HyperV

This project provides Vagrantfile and a provisioning script that sets up CentOS and installs Apache, PHP, MySQL on HyperV.

# Requirements

- Vagrant installation
- HyperV enabled in Windows Features
- HyperV internal virtual switch (with shared internet access)

# Installation

- Clone this repository
- Create config/vhosts.conf file (copy vhosts-example.conf)
- Run vagrant up. Provide Windows username/password when asked
- Restart the machine (vagrant halt/vagrant up) 