class deceptionagent::config {
  file{'/etc/deceptionlogic/':
    ensure =>  directory,
    mode   =>  '0755',
}

file { '/etc/deceptionlogic/agent.conf':
  content => template('deceptionagent/agent.conf.erb'),
  mode    => '0644',
}
}