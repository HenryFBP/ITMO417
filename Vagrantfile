# frozen_string_literal: true

Vagrant.configure('2') do |config|
  config.vm.box = 'peru/ubuntu-18.04-desktop-amd64'

  config.vm.synced_folder '.', '/mnt/ITMO417'

  config.ssh.username = 'vagrant'
  config.ssh.password = 'vagrant'
  config.ssh.insert_key = false

  config.vm.provision 'shell', run: 'always', path: 'scripts/install_tools.sh'

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--vram", "128"]
  end

end
