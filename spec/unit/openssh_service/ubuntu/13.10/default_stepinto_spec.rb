require 'spec_helper'

describe 'openssh_test::service on ubuntu-13_10' do
  let(:ubuntu_13_10_default_stepinto_run) do
    ChefSpec::Runner.new(
      :step_into => 'openssh_service',
      :platform => 'ubuntu',
      :version => '13.10'
      ) do |node|
      node.set['openssh']['service']['resource_name'] = 'ubuntu_13_10_default_stepinto'
    end.converge('openssh_test::service')
  end

  context 'when using default parameters' do
    it 'creates openssh_service[ubuntu_13_10_default_stepinto]' do
      expect(ubuntu_13_10_default_stepinto_run).to create_openssh_service('ubuntu_13_10_default_stepinto')
    end

    it 'steps into openssh_service and installs package[openssh-server]' do
      expect(ubuntu_13_10_default_stepinto_run).to install_package('openssh-server')
    end

    it 'steps into openssh_service and create template[/etc/ssh/sshd_config]' do
      expect(ubuntu_13_10_default_stepinto_run).to create_template('/etc/ssh/sshd_config').with(
        :owner => 'root',
        :mode => '0644'
        )
    end

    it 'steps into openssh_service and manages service[ssh]' do
      expect(ubuntu_13_10_default_stepinto_run).to start_service('ssh')
      expect(ubuntu_13_10_default_stepinto_run).to enable_service('ssh')
    end
  end
end
