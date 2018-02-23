# frozen_string_literal: true

service_name = node['unicorn-custom']['service']['name']

execute "daemon-reload for #{service_name}" do
  command 'systemctl daemon-reload'

  action :nothing
end

template "/etc/systemd/system/#{service_name}.service" do
  mode     0o644
  cookbook 'unicorn-custom'
  source   'etc/systemd/system/service.erb'

  variables(
    bundle_gemfile: node['unicorn-custom']['service']['bundle_gemfile'],
    bundle:         node['unicorn-custom']['service']['bundle'],
    chdir:          node['unicorn-custom']['service']['chdir'],
    config:         node['unicorn-custom']['service']['config'],
    environment:    node['unicorn-custom']['service']['environment'],
    gem_home:       node['unicorn-custom']['service']['gem_home'],
    locale:         node['unicorn-custom']['service']['locale'],
    pidfile:        node['unicorn-custom']['service']['pidfile'],
    service_name:   service_name,
    user:           node['unicorn-custom']['service']['user']
  )

  notifies :run, "execute[daemon-reload for #{service_name}]", :immediately
end

service service_name do
  supports reload: true, restart: true, status: true

  action %i[enable start]
end
