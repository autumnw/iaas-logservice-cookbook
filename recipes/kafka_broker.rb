node.default['kafka']['server.properties']['advertised.host.name'] = node['fqdn']
include_recipe "cerner_kafka::default"