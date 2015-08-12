default['kibana']['site_name'] = 'kibana'
default['kibana']['web_dir'] = '/opt/kibana/current'
default['kibana']['webserver_port'] = 443
default['kibana']['webserver_scheme'] = 'https://'
default['kibana']['webserver'] = 'nginx'
default['nginx']['dir'] = '/etc/nginx'
default['nginx']['ssl_key'] = '/etc/nginx/ssl/kibana.key'
default['nginx']['ssl_cert'] = '/etc/nginx/ssl/kibana.pem'
default['nginx']['ssl_protocols'] = 'SSLv3 TLSv1 TLSv1.1 TLSv1.2'
default['nginx']['ssl_cipher_list'] = 'ECDH+AESGCM:DH+AESGCM:ECDH+AES256:DH+AES256:ECDH+AES128:DH+AES:ECDH+3DES:DH+3DES:RSA+AESGCM:RSA+AES:RSA+3DES:!aNULL:!MD5:!DSS'
default['kibana']['nginx']['template_cookbook'] = 'iaas-logservice'
default['kibana']['nginx']['template'] = 'kibana/kibana-nginx.conf.erb'
default['kibana']['config']['request_timeout'] = 300_000
default['kibana']['config']['shard_timeout'] = 0
default['kibana']['user'] = 'nginx' 

default['kibana']['es_server'] = 'localhost'
default['kibana']['es_port'] = '9200'
default['kibana']['username'] = 'admin'
default['kibana']['password'] = 'KibanaIsFun!'

default['kibana']['server_name'] = node['fqdn']
default['kibana']['server_aliases'] = []
