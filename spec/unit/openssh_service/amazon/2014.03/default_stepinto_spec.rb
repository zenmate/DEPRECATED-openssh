require 'spec_helper'

describe 'openssh_test::service on amazon-2014.03' do
  let(:amazon_2014_03_default_stepinto_run) do
    ChefSpec::Runner.new(
      :step_into => 'openssh_service',
      :platform => 'amazon',
      :version => '2014.03'
      ) do |node|
      node.set['openssh']['service']['resource_name'] = 'amazon_2014_03_default_stepinto'
    end.converge('openssh_test::service')
  end

  context 'when using default parameters' do
    it 'creates openssh_service[amazon_2014_03_default_stepinto]' do
      expect(amazon_2014_03_default_stepinto_run).to create_openssh_service('amazon_2014_03_default_stepinto')
    end

    it 'steps into openssh_service and runs ruby_block[message for amazon-2014.03]' do
      expect(amazon_2014_03_default_stepinto_run).to write_log('Sorry, openssh_service support for amazon-2014.03 has not yet been implemented.')
    end
  end
end
