# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "niepi/ubuntu-13.10-puppet"
  #ES1
  config.vm.define "es1" do | es1 |
    es1.vm.hostname = "es1"
    es1.vm.provider "virtualbox" do |vb|
      vb.gui = true
      vb.customize ["modifyvm", :id, "--memory", "512"]
    end
  #PUPPET THINGS
  config.vm.synced_folder "puppet/", "/etc/puppet/"
  config.vm.provision :shell, :path => 'shell/init.sh', :args => '/vagrant/shell'
  config.vm.network "public_network" , :bridge => 'en0: Wi-Fi (AirPort)'
  es1.vm.provision "puppet" do |puppet|
     puppet.manifests_path = "puppet/manifests"
     puppet.manifest_file  = "base.pp"
     puppet.options = [
        '--verbose',
        '--debug',
        "--hiera_config /etc/puppet/hiera.yaml",
        "--parser future"
      ]
  end
  end
  config.vm.define "es2" do | es2 |
    es2.vm.hostname = "es2"
    es2.vm.provider "virtualbox" do |vb|
     vb.gui = true
     vb.customize ["modifyvm", :id, "--memory", "512"]
    end
  #PUPPET THINGS
  config.vm.synced_folder "puppet/", "/etc/puppet/"
  config.vm.provision :shell, :path => 'shell/init.sh', :args => '/vagrant/shell'
  config.vm.network "public_network" , :bridge => 'en0: Wi-Fi (AirPort)'
  
  es2.vm.provision "puppet" do |puppet|
     puppet.manifests_path = "puppet/manifests"
     puppet.manifest_file  = "base.pp"
     puppet.options = [
        '--verbose',
        '--debug',
        "--hiera_config /etc/puppet/hiera.yaml",
        "--parser future"
      ]
  end
 end
end
