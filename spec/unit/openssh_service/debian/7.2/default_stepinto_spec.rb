require 'spec_helper'

describe 'openssh_test::service on debian-7.2' do
  let(:debian_7_2_default_stepinto_run) do
    ChefSpec::Runner.new(
      :step_into => 'openssh_service',
      :platform => 'debian',
      :version => '7.2'
      ) do |node|
      node.set['openssh']['service']['resource_name'] = 'debian_7_2_default_stepinto'
    end.converge('openssh_test::service')
  end

  context 'when using default parameters' do
    it 'creates openssh_service[debian_7_2_default_stepinto]' do
      expect(debian_7_2_default_stepinto_run).to create_openssh_service('debian_7_2_default_stepinto')
    end

    it 'steps into openssh_service and installs package[openssh-server]' do
      expect(debian_7_2_default_stepinto_run).to install_package('openssh-server')
    end

    it 'steps into openssh_service and create template[/etc/ssh/sshd_config]' do
      expect(debian_7_2_default_stepinto_run).to create_template('/etc/ssh/sshd_config').with(
        :owner => 'root',
        :mode => '0644'
        )
    end

    it 'steps into openssh_service and manages service[ssh]' do
      expect(debian_7_2_default_stepinto_run).to start_service('ssh')
      expect(debian_7_2_default_stepinto_run).to enable_service('ssh')
    end
  end
end
