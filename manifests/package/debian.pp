class deceptionagent::debian::dependencies inherits deceptionagent {
  package { 'debian-keyring':
    ensure => 'present'
  }
  package { 'apt-transport-https':
    ensure => 'present'
  }
  package { 'debian-archive-keyring':
    ensure => 'present',
  }
}

class deceptionagent::debian::jessie inherits deceptionagent {
  exec {'add_gpg_key':
  command => "/usr/bin/curl -1sLf 'https://dl.deceptionlogic.net/public/deception-agent/cfg/gpg/gpg.3812E46CD5C4E4A6.key' | apt-key add -"
}
exec {'add_repo':
  command => "/usr/bin/curl -1sLf 'https://dl.deceptionlogic.net/public/deception-agent/cfg/setup/config.deb.txt?codename=jessie&distro=debian' > /etc/apt/sources.list.d/deception-logic-deception-agent.list"
}
exec {'update_cache':
  command => '/usr/bin/apt-get update'
}
}

class deceptionagent::debian::stretch inherits deceptionagent {
  exec {'add_gpg_key':
  command => "/usr/bin/curl -1sLf 'https://dl.deceptionlogic.net/public/deception-agent/cfg/gpg/gpg.3812E46CD5C4E4A6.key' | apt-key add -"
}
exec {'add_repo':
  command => "/usr/bin/curl -1sLf 'https://dl.deceptionlogic.net/public/deception-agent/cfg/setup/config.deb.txt?codename=stretch&distro=debian' > /etc/apt/sources.list.d/deception-logic-deception-agent.list"
}
exec {'update_cache':
  command => '/usr/bin/apt-get update'
}
}
