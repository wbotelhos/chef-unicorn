# frozen_string_literal: true

template node['unicorn-custom']['config']['config_file'] do
  mode   0o644
  source 'unicorn.rb.erb'

  variables(
    after_fork:        node['unicorn-custom']['config']['after_fork'],
    backlog:           node['unicorn-custom']['config']['backlog'],
    before_fork:       node['unicorn-custom']['config']['before_fork'],
    listen:            node['unicorn-custom']['config']['listen'],
    pid:               node['unicorn-custom']['config']['pid'],
    preload_app:       node['unicorn-custom']['config']['preload_app'],
    stderr_path:       node['unicorn-custom']['config']['stderr_path'],
    stdout_path:       node['unicorn-custom']['config']['stdout_path'],
    timeout:           node['unicorn-custom']['config']['timeout'],
    worker_processes:  node['unicorn-custom']['config']['worker_processes'],
    working_directory: node['unicorn-custom']['config']['working_directory']
  )
end
