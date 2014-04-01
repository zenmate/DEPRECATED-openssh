require 'chef/resource/lwrp_base'

class Chef
  class Resource
    class OpensshService < Chef::Resource::LWRPBase
      self.resource_name = :openssh_service
      actions  :create
      default_action :create
    end
  end
end
