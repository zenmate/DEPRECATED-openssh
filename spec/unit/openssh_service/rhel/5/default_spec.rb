require 'spec_helper'

describe 'openssh_test::service on centos-5.8' do
  let(:centos_5_8_default_run) do
    ChefSpec::Runner.new(
      :platform => 'centos',
      :version => '5.8'
      ) do |node|
      node.set['openssh']['service']['resource_name'] = 'centos_5_8_default'
    end.converge('openssh_test::service')
  end

  context 'when using default parameters' do
    it 'creates openssh_service[centos_5_8_default]' do
      expect(centos_5_8_default_run).to create_openssh_service('centos_5_8_default')
    end
  end
end
