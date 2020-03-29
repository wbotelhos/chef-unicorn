# Unicorn

[![Cookbook](http://img.shields.io/cookbook/v/chef-unicorn.svg)](https://supermarket.chef.io/cookbooks/chef-unicorn)
[![Patreon](https://img.shields.io/badge/donate-%3C3-brightgreen.svg)](https://www.patreon.com/wbotelhos)

Installs and configure Unicorn server.

## Requirements

#### Platforms

- Ubuntu 15.04+ (since we use Systemd)

## Config

|Attribute                                                   |Default|
|------------------------------------------------------------|-------|
|default['chef-unicorn']['config']['backlog']                |64     |
|default['chef-unicorn']['config']['check_client_connection']|false  |
|default['chef-unicorn']['config']['listen']                 |nil    |
|default['chef-unicorn']['config']['pid']                    |nil    |
|default['chef-unicorn']['config']['preload_app']            |true   |
|default['chef-unicorn']['config']['stderr_path']            |nil    |
|default['chef-unicorn']['config']['stdout_path']            |nil    |
|default['chef-unicorn']['config']['timeout']                |60     |
|default['chef-unicorn']['config']['worker_processes']       |4      |
|default['chef-unicorn']['config']['working_directory']      |nil    |

## Service

|-------------------------------------------------------|---------------------|
|Attribute                                              |Default              |
|default['chef-unicorn']['config']['after_fork']        |...                  |
|default['chef-unicorn']['config']['before_fork']       |...                  |
|default['chef-unicorn']['service']['bundle_gemfile']   |nil                  |
|default['chef-unicorn']['service']['bundle']           |'/usr/bin/bundle'    |
|default['chef-unicorn']['service']['config']           |nil                  |
|default['chef-unicorn']['service']['environment']      |'production'         |
|default['chef-unicorn']['service']['gem_home']         |'/usr/local/ruby/gem'|
|default['chef-unicorn']['service']['locale']           |'en_US.UTF-8'        |
|default['chef-unicorn']['service']['name']             |'unicorn'            |
|default['chef-unicorn']['service']['pidfile']          |nil                  |
|default['chef-unicorn']['service']['user']             |'deploy'             |
|default['chef-unicorn']['service']['working_directory']|'/'                  |

## Usage

#### Berkfile

```ruby
source 'https://supermarket.chef.io'

cookbook 'chef-unicorn'
```

#### Node

The following nodes is an example of the minimal needed to run correctly this cookbook:

```yml
{
  "chef-unicorn": {
    "config": {
      "config_file":       "/var/www/app/shared/config/unicorn.rb",
      "listen":            "/var/www/app/shared/run/unicorn/unicorn.sock",
      "pid":               "/var/www/app/shared/run/unicorn/unicorn.pid",
      "stderr_path":       "/var/www/app/shared/log/unicorn/error.log",
      "stdout_path":       "/var/www/app/shared/log/unicorn/out.log",
      "working_directory": "/var/www/app/current"
    },

    "service": {
      "bundle_gemfile": "/var/www/app/current/Gemfile",
      "config":         "/var/www/app/shared/config/unicorn.rb",
      "pidfile":        "/var/www/app/shared/run/unicorn/unicorn.pid"
    }
  },

  "run_list": [
    "recipe[chef-unicorn]"
  ]
}
```

## Unicorn documentation

https://bogomips.org/unicorn

## References

https://github.com/defunkt/unicorn/blob/master/examples/unicorn.conf.rb

## Love it!

Via [PayPal](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=X8HEP2878NDEG&item_name=chef-unicorn) or [Patreon](https://www.patreon.com/wbotelhos). Thanks! (:
