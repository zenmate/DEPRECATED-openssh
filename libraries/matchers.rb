if defined?(ChefSpec)
  def create_openssh_service(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:openssh_service, :create, resource_name)
  end
end
