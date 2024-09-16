# opensm sets up opensm and runs it
class opensm (
  Integer $sm_priority = 0,
  Array   $root_guids  = [],
){
  ensure_packages(['opensm'], {'ensure' => present})

  file {'/etc/opensm/opensm.conf':
    content => template('opensm/opensm.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service['opensmd'],
  }

  file {'/etc/opensm/root_guid.conf':
    content => template('opensm/root_guid.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service['opensmd'],
  }

  service { 'opensmd':
    ensure => 'running',
    enable => true,
    require => [
      Package['opensm'],
      File['/etc/opensm/opensm.conf'],
      File['/etc/opensm/root_guid.conf'],
    ],
  }
}
