# frozen_string_literal: true

service_name = node['chef-unicorn']['service']['name']

execute "daemon-reload for #{service_name}" do
  command 'systemctl daemon-reload'

  action :nothing
end

template "/etc/systemd/system/#{service_name}.service" do
  mode   0o644
  source 'etc/systemd/system/service.erb'

  variables(
    bundle_gemfile:    node['chef-unicorn']['service']['bundle_gemfile'],
    bundle:            node['chef-unicorn']['service']['bundle'],
    config:            node['chef-unicorn']['service']['config'],
    environment:       node['chef-unicorn']['service']['environment'],
    gem_home:          node['chef-unicorn']['service']['gem_home'],
    locale:            node['chef-unicorn']['service']['locale'],
    pidfile:           node['chef-unicorn']['service']['pidfile'],
    user:              node['chef-unicorn']['service']['user'],
    working_directory: node['chef-unicorn']['service']['working_directory']
  )

  notifies :run, "execute[daemon-reload for #{service_name}]", :immediately
end

service service_name do
  supports reload: true, restart: true, status: true

  action %i[enable start]
end
