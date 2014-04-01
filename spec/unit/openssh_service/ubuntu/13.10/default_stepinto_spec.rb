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

    it 'steps into openssh_service and writes log[message for ubuntu-13.10]' do
      expect(ubuntu_13_10_default_stepinto_run).to write_log('Sorry, openssh_service support for ubuntu-13.10 has not yet been implemented.')
    end
  end
end
