# Unicorn

[![Cookbook](http://img.shields.io/cookbook/v/chef-unicorn.svg)](https://supermarket.chef.io/cookbooks/chef-unicorn)
[![Patreon](https://img.shields.io/badge/donate-%3C3-brightgreen.svg)](https://www.patreon.com/wbotelhos)

Installs and configure Unicorn server.

## Requirements

#### Platforms

- Ubuntu 15.04+ (since we use Systemd)

## Config

- `node['chef-unicorn']['config']['backlog']`
- `node['chef-unicorn']['config']['check_client_connection']`
- `node['chef-unicorn']['config']['listen']`
- `node['chef-unicorn']['config']['pid']`
- `node['chef-unicorn']['config']['preload_app']`
- `node['chef-unicorn']['config']['stderr_path']`
- `node['chef-unicorn']['config']['stdout_path']`
- `node['chef-unicorn']['config']['timeout']`
- `node['chef-unicorn']['config']['worker_processes']`
- `node['chef-unicorn']['config']['working_directory']`
- `node['chef-unicorn']['config']['before_fork']`
- `node['chef-unicorn']['config']['after_fork']`

## Service

- `node['chef-unicorn']['service']['bundle']`
- `node['chef-unicorn']['service']['bundle_gemfile']`
- `node['chef-unicorn']['service']['chdir']`
- `node['chef-unicorn']['service']['config']`
- `node['chef-unicorn']['service']['environment']`
- `node['chef-unicorn']['service']['gem_home']`
- `node['chef-unicorn']['service']['locale']`
- `node['chef-unicorn']['service']['pidfile']`
- `node['chef-unicorn']['service']['name']`
- `node['chef-unicorn']['service']['user']`

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
