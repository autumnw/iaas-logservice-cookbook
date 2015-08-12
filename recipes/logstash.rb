# Encoding: utf-8
#
# Cookbook Name:: iaas-logservice
# Recipe:: logstash
#

name = node['logstash']['instance_default']['instance_name']

logstash_instance name do
  
  action            :create
end

logstash_service name do
  action      [:enable]
end

logstash_config name do
  notifies :restart, "logstash_service[#{name}]"
  action [:create]
end

logstash_pattern name do
  action [:create]
end