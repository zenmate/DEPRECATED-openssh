require 'spec_helper'

describe 'openssh_test::service on debian-7.2' do
  let(:debian_7_2_default_run) do
    ChefSpec::Runner.new(
      :platform => 'debian',
      :version => '7.2'
      ) do |node|
      node.set['openssh']['service']['resource_name'] = 'debian_7_2_default'
    end.converge('openssh_test::service')
  end

  context 'when using default parameters' do
    it 'creates openssh_service[debian_7_2_default]' do
      expect(debian_7_2_default_run).to create_openssh_service('debian_7_2_default')
    end
  end
end
