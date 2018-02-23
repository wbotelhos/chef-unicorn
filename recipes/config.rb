# frozen_string_literal: true

template node['chef-unicorn']['config']['config_file'] do
  mode   0o644
  source 'unicorn.rb.erb'

  variables(
    after_fork:        node['chef-unicorn']['config']['after_fork'],
    backlog:           node['chef-unicorn']['config']['backlog'],
    before_fork:       node['chef-unicorn']['config']['before_fork'],
    listen:            node['chef-unicorn']['config']['listen'],
    pid:               node['chef-unicorn']['config']['pid'],
    preload_app:       node['chef-unicorn']['config']['preload_app'],
    stderr_path:       node['chef-unicorn']['config']['stderr_path'],
    stdout_path:       node['chef-unicorn']['config']['stdout_path'],
    timeout:           node['chef-unicorn']['config']['timeout'],
    worker_processes:  node['chef-unicorn']['config']['worker_processes'],
    working_directory: node['chef-unicorn']['config']['working_directory']
  )
end
