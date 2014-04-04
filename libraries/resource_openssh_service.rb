require 'chef/resource/lwrp_base'

class Chef
  class Resource
    class OpensshService < Chef::Resource::LWRPBase
      self.resource_name = :openssh_service
      actions  :create
      default_action :create

      # http://www.openssh.org/cgi-bin/man.cgi?query=sshd_config
      attribute :accept_env,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :address_family,
      :kind_of => String,
      :equal_to => %w(any inet4 inet6),
      :default => nil

      attribute :allow_agent_forwarding,
      :kind_of => [TrueClass, FalseClass],
      :default => nil

      attribute :allow_groups,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :allow_tcp_forwarding,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'all', 'no', 'local', 'remote'],
      :default => nil

      attribute :allow_users,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :authentication_methods,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :authorized_keys_command,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :authorized_keys_command_user,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :authorized_keys_file,
      :kind_of => String,
      :regex => /.*/,
      :default => '%h/.ssh/authorized_keys'

      attribute :authorized_principals_file,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :banner,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :challenge_response_authentication,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :chroot_directory,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :ciphers,
      :kind_of => String,
      :regex => /.*/,
      :default => 'aes128-ctr,aes192-ctr,aes256-ctr'

      attribute :client_alive_count_max,
      :kind_of => String,
      :regex => /^\d+$/,
      :default => nil

      attribute :client_alive_interval,
      :kind_of => String,
      :regex => /^\d+$/,
      :default => nil

      attribute :compression,
      :kind_of => String,
      :equal_to => %w(yes delayed no),
      :default => nil

      attribute :deny_groups,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :deny_users,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :force_command,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :gateway_ports,
      :kind_of => String,
      :equal_to => %w(no yes clientspecified),
      :default => nil

      attribute :gssapi_authentication,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :gssapi_cleanup_credentials,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :hostbased_authentication,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :hostbased_uses_name_from_packet_only,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :host_certificate,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :host_key,
      :kind_of => [String],
      :regex => /.*/,
      :default => %w(/etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_ecdsa_key)

      attribute :host_key_agent,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :ignore_rhosts,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :ignore_user_known_hosts,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :ip_qos,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :kbd_interactive_authentication,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :kerberos_authentication,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :kerberos_get_afs_token,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :kerberos_or_local_passwd,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :kerberos_ticket_cleanup,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :kex_algorithms,
      :kind_of => String,
      :regex => /.*/,
      :default => 'diffie-hellman-group1-sha1,diffie-hellman-group14-sha1,diffie-hellman-group-exchange-sha1,diffie-hellman-group-exchange-sha256,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521'

      attribute :key_regeneration_interval,
      :kind_of => String,
      :regex => /^\d+$/,
      :default => nil

      attribute :listen_address,
      :kind_of => [String],
      :regex => /.*/,
      :default => %w(:: 0.0.0.0)

      attribute :login_grace_time,
      :kind_of => String,
      :regex => /^\d+$/,
      :default => nil

      attribute :log_level,
      :kind_of => String,
      :equal_to => %w(QUIET FATAL ERROR INFO VERBOSE DEBUG DEBUG1 DEBUG2 DEBUG3),
      :default => nil

      attribute :macs,
      :kind_of => String,
      :regex => /.*/,
      :default => 'hmac-sha2-256,hmac-sha2-512'

      attribute :max_auth_tries,
      :kind_of => String,
      :regex => /^\d+$/,
      :default => nil

      attribute :max_sessions,
      :kind_of => String,
      :regex => /^\d+$/,
      :default => nil

      attribute :max_startups,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :password_authentication,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :permit_empty_passwords,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :permit_open,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :permit_root_login,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no', 'without-password', 'forced-commands-only'],
      :default => nil

      attribute :permit_tunnel,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no', 'point-to-point', 'ethernet'],
      :default => nil

      attribute :permit_tty,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :permit_user_environment,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :pid_file,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :port,
      :kind_of => [String],
      :regex => /^\d+$/,
      :default => ['22']

      attribute :print_last_log,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :print_motd,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :protocol,
      :kind_of => String,
      :equal_to => '2',
      :default => nil

      attribute :public_key_authentication,
      :kind_of => String,
      :equal_to => '2',
      :default => nil

      attribute :rekey_limit,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :revoked_keys,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :rhost_rsa_authentication,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :rsa_authentication,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :server_key_bits,
      :kind_of => String,
      :regex => /^\d+$/,
      :default => nil

      attribute :strict_modes,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :subsystem,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :syslog_facility,
      :kind_of => String,
      :equal_to => %w(DAEMON USER AUTH LOCAL0 LOCAL1 LOCAL2 LOCAL3 LOCAL4 LOCAL5 LOCAL6 LOCAL7),
      :default => nil

      attribute :template_source,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :tcp_keep_alive,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :trusted_user_ca_keys,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :use_dns,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :use_login,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :use_privilege_separation,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no', 'sandbox'],
      :default => nil

      attribute :version_addendum,
      :kind_of => String,
      :regex => /.*/,
      :default => nil

      attribute :x11_display_offset,
      :kind_of => String,
      :regex => /^\d+$/,
      :default => nil

      attribute :x11_forwarding,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :x11_use_localhost,
      :kind_of => [TrueClass, FalseClass, String],
      :equal_to => [true, false, 'yes', 'no'],
      :default => nil

      attribute :xauth_location,
      :kind_of => String,
      :regex => /.*/,
      :default => nil
    end
  end
end
