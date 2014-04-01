require 'spec_helper'

describe 'openssh_test::service on ubuntu-10_04' do
  let(:ubuntu_10_04_default_stepinto_run) do
    ChefSpec::Runner.new(
      :step_into => 'openssh_service',
      :platform => 'ubuntu',
      :version => '10.04'
      ) do |node|
      node.set['openssh']['service']['resource_name'] = 'ubuntu_10_04_default_stepinto'
    end.converge('openssh_test::service')
  end

  context 'when using default parameters' do
    it 'creates openssh_service[ubuntu_10_04_default_stepinto]' do
      expect(ubuntu_10_04_default_stepinto_run).to create_openssh_service('ubuntu_10_04_default_stepinto')
    end

    it 'steps into openssh_service and writes log[message for ubuntu-10.04]' do
      expect(ubuntu_10_04_default_stepinto_run).to write_log('Sorry, openssh_service support for ubuntu-10.04 has not yet been implemented.')
    end
  end
end
