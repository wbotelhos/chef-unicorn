# frozen_string_literal: true

# systemd

default['unicorn-custom']['service']['bundle']         = '/usr/bin/bundle'
default['unicorn-custom']['service']['bundle_gemfile'] = nil
default['unicorn-custom']['service']['chdir']          = '/'
default['unicorn-custom']['service']['config']         = nil
default['unicorn-custom']['service']['environment']    = 'production'
default['unicorn-custom']['service']['gem_home']       = '/usr/local/ruby/gem'
default['unicorn-custom']['service']['locale']         = 'en_US.UTF-8'
default['unicorn-custom']['service']['pidfile']        = nil
default['unicorn-custom']['service']['name']           = 'unicorn'
default['unicorn-custom']['service']['user']           = 'deploy'
