require 'spec_helper'

describe 'openssh_test::service on ubuntu-13.10' do
  let(:ubuntu_13_10_default_run) do
    ChefSpec::Runner.new(
      :platform => 'ubuntu',
      :version => '13.10'
      ) do |node|
      node.set['openssh']['service']['resource_name'] = 'ubuntu_13_10_default'
    end.converge('openssh_test::service')
  end

  context 'when using default parameters' do
    it 'creates openssh_service[ubuntu_13_10_default]' do
      expect(ubuntu_13_10_default_run).to create_openssh_service('ubuntu_13_10_default')
    end
  end
end
