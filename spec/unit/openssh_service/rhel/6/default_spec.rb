require 'spec_helper'

describe 'openssh_test::service on centos-6.4' do
  let(:centos_6_4_default_run) do
    ChefSpec::Runner.new(
      :platform => 'centos',
      :version => '6.4'
      ) do |node|
      node.set['openssh']['service']['resource_name'] = 'centos_6_4_default'
    end.converge('openssh_test::service')
  end

  context 'when using default parameters' do
    it 'creates openssh_service[centos_6_4_default]' do
      expect(centos_6_4_default_run).to create_openssh_service('centos_6_4_default')
    end
  end
end
