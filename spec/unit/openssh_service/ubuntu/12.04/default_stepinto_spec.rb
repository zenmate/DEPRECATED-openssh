require 'spec_helper'

describe 'openssh_test::service on ubuntu-12_04' do
  let(:ubuntu_12_04_default_stepinto_run) do
    ChefSpec::Runner.new(
      :step_into => 'openssh_service',
      :platform => 'ubuntu',
      :version => '12.04'
      ) do |node|
      node.set['openssh']['service']['resource_name'] = 'ubuntu_12_04_default_stepinto'
    end.converge('openssh_test::service')
  end

  context 'when using default parameters' do
    it 'creates openssh_service[ubuntu_12_04_default_stepinto]' do
      expect(ubuntu_12_04_default_stepinto_run).to create_openssh_service('ubuntu_12_04_default_stepinto')
    end

    it 'steps into openssh_service and installs package[openssh-server]' do
      expect(ubuntu_12_04_default_stepinto_run).to install_package('openssh-server')
    end

    it 'steps into openssh_service and create template[/etc/ssh/sshd_config]' do
      expect(ubuntu_12_04_default_stepinto_run).to create_template('/etc/ssh/sshd_config').with(
        :owner => 'root',
        :mode => '0644'
        )
    end

    it 'steps into openssh_service and manages service[ssh]' do
      expect(ubuntu_12_04_default_stepinto_run).to start_service('ssh')
      expect(ubuntu_12_04_default_stepinto_run).to enable_service('ssh')
    end
  end
end
