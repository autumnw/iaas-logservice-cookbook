name             'iaas-logservice'
maintainer       ''
maintainer_email ''
license          ''
description      'Installs/Configures iaas-logservice'
long_description 'Installs/Configures iaas-logservice'
version          '0.1.5'

depends 'elasticsearch'
depends 'apache_zookeeper'
depends 'cerner_kafka'
depends 'logstash'
depends 'kibana_lwrp'
depends 'openssl'
depends 'nginx'
depends 'htpasswd'