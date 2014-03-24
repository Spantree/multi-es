class { 'java7':
  before => Class['elasticsearch']
}


if $elasticsearch_values == undef {
   $elasticsearch_values = hiera('elasticsearch', false)
}

$elasticsearch_publish_host = $vm_type ? {
  'vagrant' => $ipaddress_eth1,
  default   => $ipaddress_eth1
}

$elasticsearch_version = $elasticsearch_values['version']
$elasticsearch_cluster_name = $elasticsearch_values['cluster_name']

class { 'elasticsearch':
  package_url => "https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-${elasticsearch_version}.deb",
  config      => {
    'http' => {
      'max_content_length'=> '500mb'
    },
    'network' => {
      'publish_host'  => $elasticsearch_publish_host
    },
    'cluster' => {
      'name' => $elasticsearch_cluster_name
    }
  }
}


elasticsearch::plugin{'mobz/elasticsearch-head':
  module_dir  => 'head',
  require => Class['java7']
}

elasticsearch::plugin { 'elasticsearch/marvel/latest':
  module_dir  => 'marvel',
  require => Class['java7']
}

elasticsearch::plugin { 'lukas-vlcek/bigdesk':
  module_dir  => 'bigdesk',
  require => Class['java7']
}
