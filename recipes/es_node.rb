# Encoding: utf-8
#
# Cookbook Name:: iaas-logservice
# Recipe:: es_node
#

include_recipe 'chef-sugar'
include_recipe 'curl'

# see README.md and test/fixtures/cookbooks for more examples!
elasticsearch_user 'elasticsearch'
elasticsearch_install 'elasticsearch-master-node' do
  version	node['elasticsearch']['package']['version']
  type		:package
  action 	:install
  dir  	node['elasticsearch']['package']['dir']
  package_url node['elasticsearch']['package']['package_url']
  package_checksum node['elasticsearch']['package']['package_checksum']
end
elasticsearch_configure 'elasticsearch-master-node' do
  dir node['elasticsearch']['config']['dir']
  es_home node['elasticsearch']['config']['es_home']
  java_home node['elasticsearch']['config']['java_home']
  path_data node['elasticsearch']['config']['path_data']
  configuration({'cluster.name' => node['elasticsearch']['cluster_name'],
                 'index.number_of_replicas' => node['elasticsearch']['index']['number_of_replicas'],
                 'number_of_shards' => node['elasticsearch']['index']['number_of_shards'],
                 'discovery.zen.ping.multicast.enabled' => node['elasticsearch']['discovery']['multicast'],
                 'discovery.zen.ping.unicast.hosts' => node['elasticsearch']['discovery']['unicast_hosts'],
                 'http.enabled' => node['elasticsearch']['http_enabled'],
                 'node.data' => node['elasticsearch']['node']['data'],
                 'node.master' => node['elasticsearch']['node']['master']
  })
end
elasticsearch_service 'elasticsearch' do
  bindir node['elasticsearch']['bindir']
  path_conf node['elasticsearch']['path_conf']
  pid_path node['elasticsearch']['pid_path']
end