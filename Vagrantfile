# frozen_string_literal: true

Vagrant.configure('2') do |config|
  config.vm.box = 'chenhan/lubuntu-desktop-18.04'
  config.vm.box_version = '20180704.0.0'

  config.vm.synced_folder '.', '/ITMO417'

  config.ssh.username = 'vagrant'
  config.ssh.password = 'vagrant'
  config.ssh.insert_key = false

  config.vm.provision 'shell', run: 'always', path: 'scripts/install_tools.sh'

end
