# Encoding: utf-8
#
# Cookbook Name:: iaas-logservice
# Recipe:: kibana_ssl
#
# Copyright 2015, Autumn Wang
#

include_recipe 'chef-sugar'

include_recipe 'openssl'
directory "#{node['nginx']['dir']}/ssl" do
  owner 'root'
  group 'root'
  mode 0755
  action :create
  recursive true
end

if node.run_state.key?('logservice_kibana_password')
  basic_auth_password = node.run_state['logservice_kibana_password']
elsif node.deep_fetch('kibana', 'password')
  basic_auth_password = node.deep_fetch('kibana', 'password')
else
  ::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)
  basic_auth_password = secure_password
end

if node.run_state.key?('logservice_kibana_username')
  basic_auth_username = node.run_state['logservice_kibana_username']
elsif node.deep_fetch('kibana', 'username')
  basic_auth_username = node.deep_fetch('kibana', 'username')
else
  basic_auth_username = 'kibana'
end

htpasswd "#{node['nginx']['dir']}/htpassword" do
  user basic_auth_username
  password basic_auth_password
  action :overwrite
end

## To file access error on hardened images
file "#{node['nginx']['dir']}/htpassword" do
  mode '0644'
  action :touch
end

# write this for testing
basic_auth_file = "#{node['nginx']['dir']}/htpassword.curl"
file basic_auth_file do
  owner 'root'
  group 'root'
  mode 0600
  content "user = \"#{basic_auth_username}:#{basic_auth_password}\""
  action :create_if_missing
  only_if { node.chef_environment == '_default' } # only in testing or _default
end

site_name = node['kibana']['site_name']
key_file = "#{node['nginx']['dir']}/ssl/#{site_name}.key"
cert_file = "#{node['nginx']['dir']}/ssl/#{site_name}.pem"
openssl_x509 cert_file do
  common_name node.name
  org 'Kibana'
  org_unit 'Kibana'
  country 'US'
  key_file key_file
end