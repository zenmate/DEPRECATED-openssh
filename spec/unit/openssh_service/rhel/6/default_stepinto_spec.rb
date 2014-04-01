require 'spec_helper'

describe 'openssh_test::service on centos-6.4' do
  let(:centos_6_4_default_stepinto_run) do
    ChefSpec::Runner.new(
      :step_into => 'openssh_service',
      :platform => 'centos',
      :version => '6.4'
      ) do |node|
      node.set['openssh']['service']['resource_name'] = 'centos_6_4_default_stepinto'
    end.converge('openssh_test::service')
  end

  context 'when using default parameters' do
    it 'creates openssh_service[centos_6_4_default_stepinto]' do
      expect(centos_6_4_default_stepinto_run).to create_openssh_service('centos_6_4_default_stepinto')
    end

    it 'steps into openssh_service and writes log[message for centos-6.4]' do
      expect(centos_6_4_default_stepinto_run).to write_log('Sorry, openssh_service support for centos-6.4 has not yet been implemented.')
    end
  end
end
