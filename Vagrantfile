# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.8.4'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # OS Box
  config.vm.box = 'hashicorp/precise64'

  # Enabling the Berkshelf plugin.
  config.berkshelf.enabled = true

  # Use the last version of chef
  config.omnibus.chef_version = :latest

  # Network
  config.vm.network :private_network, ip: "192.168.50.4"

  config.vm.provision :chef_solo do |chef|
     chef.cookbooks_path = ["cookbooks"]
     chef.roles_path = "roles"
     # chef.data_bags_path = "data_bags"
     chef.run_list = ["role[webserver]"]
     chef.json = {}
  end

end
