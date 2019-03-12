class deceptionagent::rhel::dependencies inherits deceptionagent {
  package { 'yum-utils':
    ensure => 'present'
  }
  package { 'pygpgme':
    ensure => 'present'
  }
  package { 'wget':
    ensure => 'present',
  }
}

class deceptionagent::rhel::rhel6 inherits deceptionagent {
    exec {'add_gpg_key':
  command => "/bin/rpm --import 'https://dl.deceptionlogic.net/public/deception-agent/cfg/gpg/gpg.3812E46CD5C4E4A6.key'"
}
  exec {'retrieve_repo':
  command => "/usr/bin/wget -q 'https://dl.deceptionlogic.net/public/deception-agent/cfg/setup/config.rpm.txt?codename=6&distro=el' -O /tmp/deception-logic-deception-agent.repo"
}
exec { 'add repo':
  command => '/usr/bin/yum-config-manager --add-repo /tmp/deception-logic-deception-agent.repo'
}
}


class deceptionagent::rhel::rhel7 inherits deceptionagent {
    exec {'add_gpg_key':
  command => "/usr/bin/rpm --import 'https://dl.deceptionlogic.net/public/deception-agent/cfg/gpg/gpg.3812E46CD5C4E4A6.key'"
}
  exec {'retrieve_repo':
  command => "/usr/bin/wget -q 'https://dl.deceptionlogic.net/public/deception-agent/cfg/setup/config.rpm.txt?codename=7&distro=el' -O /tmp/deception-logic-deception-agent.repo"
}
exec { 'add repo':
	command => '/usr/bin/yum-config-manager --add-repo /tmp/deception-logic-deception-agent.repo'
}
}
