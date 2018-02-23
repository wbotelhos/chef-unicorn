description      'Installs and configure Unicorn server.'
license          'MIT'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
maintainer       'Washington Botelho'
maintainer_email 'wbotelhos@gmail.com'
name             'chef-unicorn'
version          '0.1.0'

recipe 'unicorn-custom::config',  'Installs configuration.'
recipe 'unicorn-custom::service', 'Installs service file.'

issues_url 'https://github.com/wbotelhos/chef-unicorn/issues'
source_url 'https://github.com/wbotelhos/chef-unicorn'

supports 'ubuntu'

chef_version '>= 12'
