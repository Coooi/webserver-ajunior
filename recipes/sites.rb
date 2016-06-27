
include_recipe 'git'
include_recipe 'apache2::default'

node[:apache][:sites].each do |site_name, site_data|
    document_root = "/var/www/html/#{site_name}"
    conf_name = "#{site_name}.conf"
    conf_path = "#{node['apache']['dir']}/conf-available"

    Chef::Log.info "## Clonning #{site_name} on #{document_root}"
    # Create document_root
    directory document_root do
      mode "0755"
      recursive true
    end
    # Update content from git
    git document_root do
      repository site_data[:git_url]
      revision "master"
      checkout_branch "master"
      enable_checkout false
      action :sync
    end

    Chef::Log.info "## apache config for site: #{site_name}"
    # Remove Apache virtual host configuration
    file "#{conf_path}/#{conf_name}" do
        action :delete
    end
    # Add a template for Apache virtual host configuration
    template "#{conf_path}/#{conf_name}" do
        source "site.conf.erb"
        mode "0644"
        backup false
        variables(
            document_root: document_root,
            port: site_data[:port]
        )
        notifies :restart, 'service[apache2]', :delayed
    end
    # Enable the site
    apache_config site_name do
      enable true
    end
end
