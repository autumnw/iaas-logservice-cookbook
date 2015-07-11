# Encoding: utf-8
#
# Cookbook Name:: iaas-logservice
# Recipe:: logstash_collector
#

name = node['logstash']['instance_default']['collector_name']

# these should all default correctly.  listing out for example.
logstash_instance name do
  
  action            :create
end

# services are hard! Let's go LWRP'ing.   FIREBALL! FIREBALL! FIREBALL!
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