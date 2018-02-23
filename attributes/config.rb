# frozen_string_literal: true

default['unicorn-custom']['config']['backlog']                 = 64
default['unicorn-custom']['config']['check_client_connection'] = false
default['unicorn-custom']['config']['listen']                  = nil
default['unicorn-custom']['config']['pid']                     = nil
default['unicorn-custom']['config']['preload_app']             = true
default['unicorn-custom']['config']['stderr_path']             = nil
default['unicorn-custom']['config']['stdout_path']             = nil
default['unicorn-custom']['config']['timeout']                 = 60
default['unicorn-custom']['config']['worker_processes']        = 4
default['unicorn-custom']['config']['working_directory']       = nil

default['unicorn-custom']['config']['before_fork'] = <<-BEFOREFORK
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

default['unicorn-custom']['config']['after_fork'] = <<-AFTERFORK
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord::Base)
AFTERFORK
