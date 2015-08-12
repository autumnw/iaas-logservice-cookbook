# Encoding: utf-8
#
# Recipe:: logstash_lumberjack
# Cookbook Name:: iaas-logservice
#
# Copyright 2015, Autumn Wang
#

directory node['logstash']['instance_default']['basedir'] do
  owner node['logstash']['instance_default']['user']
  group node['logstash']['instance_default']['group']
  mode '0755'
end

node.default['lumberjack']['ssl_dir'] = node['logstash']['instance_default']['basedir']
node.default['lumberjack']['ssl_key_path'] = "#{node['lumberjack']['ssl_dir']}/#{node['lumberjack']['ssl key']}"
node.default['lumberjack']['ssl_cert_path'] = "#{node['lumberjack']['ssl_dir']}/#{node['lumberjack']['ssl certificate']}"
node.default['lumberjack']['user'] = node['logstash']['instance_default']['user']
node.default['lumberjack']['group'] = node['logstash']['instance_default']['group']

include_recipe 'iaas-logservice::_lumberjack_secrets'
include_recipe 'iaas-logservice::logstash'


