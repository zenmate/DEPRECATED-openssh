require 'spec_helper'

describe 'openssh_test::service on omnios-151006' do
  let(:omnios_151006_default_run) do
    ChefSpec::Runner.new(
      :platform => 'omnios',
      :version => '151006'
      ) do |node|
      node.set['openssh']['service']['resource_name'] = 'omnios_151006_default'
    end.converge('openssh_test::service')
  end

  context 'when using default parameters' do
    it 'creates openssh_service[omnios_151006_default]' do
      expect(omnios_151006_default_run).to create_openssh_service('omnios_151006_default')
    end
  end
end
