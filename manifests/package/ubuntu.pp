class deceptionagent::ubuntu::xenial inherits deceptionagent {
  exec {'add_gpg_key':
  command => "/usr/bin/curl -1sLf 'https://dl.deceptionlogic.net/public/deception-agent/cfg/gpg/gpg.3812E46CD5C4E4A6.key' | apt-key add -"
}

 exec{'add_repo':
  command => "/usr/bin/curl -1sLf 'https://dl.deceptionlogic.net/public/deception-agent/cfg/setup/config.deb.txt?codename=xenial&distro=ubuntu' > /etc/apt/sources.list.d/deception-logic-deception-agent.list"
}
 exec {'update_cache':
 command => "/usr/bin/apt-get update"
}
}


class deceptionagent::ubuntu::artful inherits deceptionagent {
  exec {'add_gpg_key':
  command => "/usr/bin/curl -1sLf 'https://dl.deceptionlogic.net/public/deception-agent/cfg/gpg/gpg.3812E46CD5C4E4A6.key' | apt-key add -"
}

 exec{'add_repo':
  command => "/usr/bin/curl -1sLf 'https://dl.deceptionlogic.net/public/deception-agent/cfg/setup/config.deb.txt?codename=artful&distro=ubuntu' > /etc/apt/sources.list.d/deception-logic-deception-agent.list"
}
 exec {'update_cache':
 command => "/usr/bin/apt-get update"
}
}


class deceptionagent::ubuntu::trusty inherits deceptionagent {
  exec {'add_gpg_key':
  command => "/usr/bin/curl -1sLf 'https://dl.deceptionlogic.net/public/deception-agent/cfg/gpg/gpg.3812E46CD5C4E4A6.key' | apt-key add -"
}

 exec{'add_repo':
  command => "/usr/bin/curl -1sLf 'https://dl.deceptionlogic.net/public/deception-agent/cfg/setup/config.deb.txt?codename=trusty&distro=ubuntu' > /etc/apt/sources.list.d/deception-logic-deception-agent.list"
}
 exec {'update_cache':
 command => "/usr/bin/apt-get update"
}
}