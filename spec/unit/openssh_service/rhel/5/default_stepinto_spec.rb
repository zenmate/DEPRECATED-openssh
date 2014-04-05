require 'spec_helper'

describe 'openssh_test::service on centos-5.8' do
  let(:centos_5_8_default_stepinto_run) do
    ChefSpec::Runner.new(
      :step_into => 'openssh_service',
      :platform => 'centos',
      :version => '5.8'
      ) do |node|
      node.set['openssh']['service']['resource_name'] = 'centos_5_8_default_stepinto'
    end.converge('openssh_test::service')
  end

  context 'when using default parameters' do
    it 'creates openssh_service[centos_5_8_default_stepinto]' do
      expect(centos_5_8_default_stepinto_run).to create_openssh_service('centos_5_8_default_stepinto')
    end

    it 'creates openssh_service[centos_5_8_default_stepinto]' do
      expect(centos_5_8_default_stepinto_run).to create_openssh_service('centos_5_8_default_stepinto')
    end

    it 'steps into openssh_service and installs package[openssh-server]' do
      expect(centos_5_8_default_stepinto_run).to install_package('openssh-server')
    end

    it 'steps into openssh_service and create template[/etc/ssh/sshd_config]' do
      expect(centos_5_8_default_stepinto_run).to create_template('/etc/ssh/sshd_config').with(
        :owner => 'root',
        :mode => '0644'
        )
    end

    it 'steps into openssh_service and manages service[sshd]' do
      expect(centos_5_8_default_stepinto_run).to start_service('sshd')
      expect(centos_5_8_default_stepinto_run).to enable_service('sshd')
    end
  end
end
