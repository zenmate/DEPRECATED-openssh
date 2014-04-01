require 'spec_helper'

describe 'openssh_test::service on windows-2008R2' do
  let(:windows_2008R2_default_stepinto_run) do
    ChefSpec::Runner.new(
      :step_into => 'openssh_service',
      :platform => 'windows',
      :version => '2008R2'
      ) do |node|
      node.set['openssh']['service']['resource_name'] = 'windows_2008R2_default_stepinto'
    end.converge('openssh_test::service')
  end

  context 'when using default parameters' do
    it 'creates openssh_service[windows_2008R2_default_stepinto]' do
      expect(windows_2008R2_default_stepinto_run).to create_openssh_service('windows_2008R2_default_stepinto')
    end

    # FIXME: weird.. goes in as 2008R2, comes out as 6.1.7600
    it 'steps into openssh_service and writes log[message for windows-6.1.7600]' do
      expect(windows_2008R2_default_stepinto_run).to write_log('Sorry, openssh_service support for windows-6.1.7600 has not yet been implemented.')
    end
  end
end
