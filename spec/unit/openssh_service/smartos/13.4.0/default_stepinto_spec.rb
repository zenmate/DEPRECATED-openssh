require 'spec_helper'

describe 'openssh_test::service on smartos-5_11' do
  let(:smartos_5_11_default_stepinto_run) do
    ChefSpec::Runner.new(
      :step_into => 'openssh_service',
      :platform => 'smartos',
      :version => '5.11'
      ) do |node|
      node.set['openssh']['service']['resource_name'] = 'smartos_5_11_default_stepinto'
    end.converge('openssh_test::service')
  end

  context 'when using default parameters' do
    it 'creates openssh_service[smartos_5_11_default_stepinto]' do
      expect(smartos_5_11_default_stepinto_run).to create_openssh_service('smartos_5_11_default_stepinto')
    end

    it 'steps into openssh_service and writes log[message for smartos-5.11]' do
      expect(smartos_5_11_default_stepinto_run).to write_log('Sorry, openssh_service support for smartos-5.11 has not yet been implemented.')
    end
  end
end
