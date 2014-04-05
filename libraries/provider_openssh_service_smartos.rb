require 'chef/provider/lwrp_base'

class Chef
  class Provider
    class OpensshService
      class Smartos < Chef::Provider::OpensshService
        use_inline_resources if defined?(use_inline_resources)

        def whyrun_supported?
          true
        end

        action :create do
          converge_by 'smartos pattern' do

            template '/etc/ssh/sshd_config' do
              if new_resource.template_source.nil?
                source 'sshd_config.erb'
                cookbook 'openssh'
              else
                source new_resource.template_source
              end
              owner 'root'
              mode '0644'
              variables(:config => new_resource)
#              notifies :restart, 'service[ssh]'
              action :create
            end

            service 'ssh' do
              provider Chef::Provider::Service::Solaris
              action [:start, :enable]
            end
          end
        end
      end
    end
  end
end

Chef::Platform.set :platform => :smartos, :resource => :openssh_service, :provider => Chef::Provider::OpensshService::Smartos
