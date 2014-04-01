require 'chef/provider/lwrp_base'

class Chef
  class Provider
    class OpensshService
      class Omnios < Chef::Provider::OpensshService
        use_inline_resources if defined?(use_inline_resources)

        def whyrun_supported?
          true
        end

        action :create do
          converge_by 'omnios pattern' do

            log "Sorry, openssh_service support for #{node['platform']}-#{node['platform_version']} has not yet been implemented." do
              level :info
            end

          end
        end
      end
    end
  end
end

Chef::Platform.set :platform => :omnios, :resource => :openssh_service, :provider => Chef::Provider::OpensshService::Omnios
