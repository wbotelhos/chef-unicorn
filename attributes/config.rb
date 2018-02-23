# frozen_string_literal: true

default['chef-unicorn']['config']['backlog']                 = 64
default['chef-unicorn']['config']['check_client_connection'] = false
default['chef-unicorn']['config']['listen']                  = nil
default['chef-unicorn']['config']['pid']                     = nil
default['chef-unicorn']['config']['preload_app']             = true
default['chef-unicorn']['config']['stderr_path']             = nil
default['chef-unicorn']['config']['stdout_path']             = nil
default['chef-unicorn']['config']['timeout']                 = 60
default['chef-unicorn']['config']['worker_processes']        = 4
default['chef-unicorn']['config']['working_directory']       = nil

default['chef-unicorn']['config']['before_fork'] = <<-BEFOREFORK
  ActiveRecord::Base.connection.disconnect! if defined?(ActiveRecord::Base)

  old_pid = "\#{server.config[:pid]}.oldbin"

  if File.exist?(old_pid) && old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU

      Process.kill sig, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
      # already killed
    end

    sleep 1
  end

  ActiveRecord::Base.connection.disconnect! if defined?(ActiveRecord::Base)
BEFOREFORK

default['chef-unicorn']['config']['after_fork'] = <<-AFTERFORK
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord::Base)
AFTERFORK
