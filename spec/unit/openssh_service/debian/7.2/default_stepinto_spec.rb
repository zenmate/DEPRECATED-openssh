require 'spec_helper'

describe 'openssh_test::service on debian-7.2' do
  let(:debian_7_2_default_stepinto_run) do
    ChefSpec::Runner.new(
      :step_into => 'openssh_service',
      :platform => 'debian',
      :version => '7.2'
      ) do |node|
      node.set['openssh']['service']['resource_name'] = 'debian_7_2_default_stepinto'
    end.converge('openssh_test::service')
  end

  context 'when using default parameters' do
    it 'creates openssh_service[debian_7_2_default_stepinto]' do
      expect(debian_7_2_default_stepinto_run).to create_openssh_service('debian_7_2_default_stepinto')
    end

    it 'steps into openssh_service and writes log[message for debian-7.2]' do
      expect(debian_7_2_default_stepinto_run).to write_log('Sorry, openssh_service support for debian-7.2 has not yet been implemented.')
    end
  end
end
