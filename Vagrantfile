require_relative './key_authorization'

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/trusty64'
  authorize_key_for_root config, '~/.ssh/id_dsa.pub', '~/.ssh/id_rsa.pub'

  {
    'ansible-ubuntu-aptcacher-ng-server'    => '192.168.33.13',
    'ansible-ubuntu-aptcacher-ng-client'   => '192.168.33.14'
  }.each do |short_name, ip|
    config.vm.define short_name do |host|
      host.vm.network 'private_network', ip: ip
      host.vm.hostname = "#{short_name}.myapp.dev"
    end
  end
end
