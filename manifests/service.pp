# Class: zookeeper::service

class zookeeper::service(
  $cfg_dir = '/etc/zookeeper/conf',
  $service_pkg = ['zookeeperd'],
  $service     = 'zookeeper',
){
  require zookeeper::install

  service { $service:
    ensure     => 'running',
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => [
      Package[$service_pkg],
      File["${cfg_dir}/zoo.cfg"]
    ]
  }
}