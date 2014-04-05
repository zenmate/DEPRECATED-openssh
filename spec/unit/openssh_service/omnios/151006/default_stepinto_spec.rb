require 'spec_helper'

describe 'openssh_test::service on omnios-151006' do
  let(:omnios_151006_default_stepinto_run) do
    ChefSpec::Runner.new(
      :step_into => 'openssh_service',
      :platform => 'omnios',
      :version => '151006'
      ) do |node|
      node.set['openssh']['service']['resource_name'] = 'omnios_151006_default_stepinto'
    end.converge('openssh_test::service')
  end

  context 'when using default parameters' do
    it 'creates openssh_thing[omnios_151006_default_stepinto]' do
      expect(omnios_151006_default_stepinto_run).to create_openssh_service('omnios_151006_default_stepinto')
    end

    it 'steps into openssh_service and writes log[message for omnios-151006]' do
      expect(omnios_151006_default_stepinto_run).to write_log('Sorry, openssh_service support for omnios-151006 has not yet been implemented.')
    end
  end
end
