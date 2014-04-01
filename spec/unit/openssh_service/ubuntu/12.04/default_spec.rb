require 'spec_helper'

describe 'openssh_test::service on ubuntu-12.04' do
  let(:ubuntu_12_04_default_run) do
    ChefSpec::Runner.new(
      :platform => 'ubuntu',
      :version => '12.04'
      ) do |node|
      node.set['openssh']['service']['resource_name'] = 'ubuntu_12_04_default'
    end.converge('openssh_test::service')
  end

  context 'when using default parameters' do
    it 'creates openssh_service[ubuntu_12_04_default]' do
      expect(ubuntu_12_04_default_run).to create_openssh_service('ubuntu_12_04_default')
    end
  end
end
