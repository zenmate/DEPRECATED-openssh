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

    it 'steps into openssh_service and writes log[message for centos-5.8]' do
      expect(centos_5_8_default_stepinto_run).to write_log('Sorry, openssh_service support for centos-5.8 has not yet been implemented.')
    end
  end
end
