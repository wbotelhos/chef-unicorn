# frozen_string_literal: true

# systemd

default['chef-unicorn']['service']['bundle_gemfile']    = nil
default['chef-unicorn']['service']['bundle']            = '/usr/bin/bundle'
default['chef-unicorn']['service']['config']            = nil
default['chef-unicorn']['service']['environment']       = 'production'
default['chef-unicorn']['service']['environment_file']  = ''
default['chef-unicorn']['service']['gem_home']          = '/usr/local/ruby/gem'
default['chef-unicorn']['service']['locale']            = 'en_US.UTF-8'
default['chef-unicorn']['service']['name']              = 'unicorn'
default['chef-unicorn']['service']['pidfile']           = nil
default['chef-unicorn']['service']['user']              = 'deploy'
default['chef-unicorn']['service']['working_directory'] = '/'
