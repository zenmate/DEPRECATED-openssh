require 'spec_helper'

describe 'openssh_test::service on fedora-19' do
  let(:fedora_19_default_stepinto_run) do
    ChefSpec::Runner.new(
      :step_into => 'openssh_service',
      :platform => 'fedora',
      :version => '19'
      ) do |node|
      node.set['openssh']['service']['resource_name'] = 'fedora_19_default_stepinto'
    end.converge('openssh_test::service')
  end

  context 'when using default parameters' do
    it 'creates openssh_service[fedora_19_default_stepinto]' do
      expect(fedora_19_default_stepinto_run).to create_openssh_service('fedora_19_default_stepinto')
    end

    it 'steps into openssh_service and writes log[message for fedora-19]' do
      expect(fedora_19_default_stepinto_run).to write_log('Sorry, openssh_service support for fedora-19 has not yet been implemented.')
    end
  end
end
