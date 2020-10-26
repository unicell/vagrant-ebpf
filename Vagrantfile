# -*- mode: ruby -*-
# vi: set ft=ruby :

$node_count = (ENV['NODE_COUNT'] || 0).to_i

def nodeIP(id)
    return "192.168.66.#{id+200}"
end

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://app.vagrantup.com/boxes/search
  config.vm.box = "ubuntu/focal64"

  # config.vm.box_check_update = false
  config.vbguest.auto_update = false

  config.vm.define "devbox" do |devbox|
      devbox.vm.network "private_network", ip: "192.168.66.101"
      devbox.vm.provider "virtualbox" do |vb|
          vb.name = "devbox"
          vb.cpus = 2
          vb.memory = "4096"
      end
      devbox.vm.synced_folder ".", "/vagrant", disabled: false
  end

  (1..$node_count).each do |i|
      config.vm.define "node-#{i}" do |node|
          #node_shortname = "#{hostname_prefix}node-#{i}"
          node_ip = nodeIP(i)
          #node.vm.hostname = "#{node_shortname}#{hostname_suffix}"
          node.vm.network :private_network, ip: "#{node_ip}"
          node.vm.provider :virtualbox do |vb|
              #vb.name = node.vm.hostname
              vb.cpus = "1"
              vb.memory = "512"
              #vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
          node.vm.provision "shell", inline: "echo hello from node #{i}"
          end
      end
  end

  config.vm.provision "shell", inline: <<-SHELL
    /vagrant/setup.sh
    #/vagrant/install-pahole.sh
    #/vagrant/install-bcc.sh
    #/vagrant/mount.sh
    #echo "alias t='sudo /mnt/ebpf/xdp-tutorial/testenv/testenv.sh'" >>/home/vagrant/.bashrc
  SHELL
end
