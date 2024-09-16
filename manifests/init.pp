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
  }
}
