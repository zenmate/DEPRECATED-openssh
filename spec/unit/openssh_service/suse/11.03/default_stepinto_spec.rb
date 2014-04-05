require 'spec_helper'

describe 'openssh_test::service on suse-11.03' do
  let(:suse_11_03_default_stepinto_run) do
    ChefSpec::Runner.new(
      :step_into => 'openssh_service',
      :platform => 'suse',
      :version => '11.03'
      ) do |node|
      node.set['openssh']['service']['resource_name'] = 'suse_11_03_default_stepinto'
    end.converge('openssh_test::service')
  end

  context 'when using default parameters' do
    it 'creates openssh_service[suse_11_03_default_stepinto]' do
      expect(suse_11_03_default_stepinto_run).to create_openssh_service('suse_11_03_default_stepinto')
    end

    it 'creates openssh_service[suse_11_03_default_stepinto]' do
      expect(suse_11_03_default_stepinto_run).to create_openssh_service('suse_11_03_default_stepinto')
    end

    it 'steps into openssh_service and installs package[openssh]' do
      expect(suse_11_03_default_stepinto_run).to install_package('openssh')
    end

    it 'steps into openssh_service and create template[/etc/ssh/sshd_config]' do
      expect(suse_11_03_default_stepinto_run).to create_template('/etc/ssh/sshd_config').with(
        :owner => 'root',
        :mode => '0644'
        )
    end

    it 'steps into openssh_service and manages service[sshd]' do
      expect(suse_11_03_default_stepinto_run).to start_service('sshd')
      expect(suse_11_03_default_stepinto_run).to enable_service('sshd')
    end
  end
end
