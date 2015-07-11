# Encoding: utf-8
#
# Cookbook Name:: iaas-logservice
# Recipe:: es_plugins
#

include_recipe 'chef-sugar'
include_recipe 'curl'

if node['elasticsearch'].has_key?('plugins')
  node['elasticsearch']['plugins'].keys.each do |name|
    plugin = node['elasticsearch']['plugins'][name]
    elasticsearch_plugin name do
      action plugin['action']
      plugin_dir plugin['plugin_dir']
      bindir plugin['bindir']
      plugin_name name
    end
  end
end