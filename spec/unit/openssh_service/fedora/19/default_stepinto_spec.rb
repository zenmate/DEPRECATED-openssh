require 'spec_helper'

describe 'openssh_test::service on fedora-19' do
  let(:fedora_19_default_stepinto_run) do
    ChefSpec::Runner.new(
      :step_into => 'openssh_service',
      :platform => 'fedora',
      :version => '19'
      ) do |node|
      node.set['openssh']['service']['resource_name'] = 'fedora_19_default_stepinto'
    end.converge('openssh_test::service')
  end

  context 'when using default parameters' do
    it 'creates openssh_service[fedora_19_default_stepinto]' do
      expect(fedora_19_default_stepinto_run).to create_openssh_service('fedora_19_default_stepinto')
    end

    it 'creates openssh_service[fedora_19_default_stepinto]' do
      expect(fedora_19_default_stepinto_run).to create_openssh_service('fedora_19_default_stepinto')
    end

    it 'steps into openssh_service and installs package[openssh-server]' do
      expect(fedora_19_default_stepinto_run).to install_package('openssh-server')
    end

    it 'steps into openssh_service and create template[/etc/ssh/sshd_config]' do
      expect(fedora_19_default_stepinto_run).to create_template('/etc/ssh/sshd_config').with(
        :owner => 'root',
        :mode => '0644'
        )
    end

    it 'steps into openssh_service and manages service[sshd]' do
      expect(fedora_19_default_stepinto_run).to start_service('sshd')
      expect(fedora_19_default_stepinto_run).to enable_service('sshd')
    end
  end
end
