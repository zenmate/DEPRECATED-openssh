require 'spec_helper'

describe 'openssh_test::service on windows-2008R2' do
  let(:windows_2008R2_default_run) do
    ChefSpec::Runner.new(
      :platform => 'windows',
      :version => '2008R2'
      ) do |node|
      node.set['openssh']['service']['resource_name'] = 'windows_2008R2_default'
    end.converge('openssh_test::service')
  end

  context 'when using default parameters' do
    it 'creates openssh_service[windows_2008R2_default]' do
      expect(windows_2008R2_default_run).to create_openssh_service('windows_2008R2_default')
    end
  end
end
