# Example Puppet for Deception Logic

## Installation

1. install puppetmaster on master/server (apt/yum install puppetmaster)
2. install puppet on agents/clients (apt/yum install puppet)

## Post-Installation

edit /etc/hosts on all machines:

```shell
ip  master
ip  agent1
ip  agent2
```

master node  /etc/puppet/puppet.conf:

```shell
[main]
...
dns_alt_names = puppet
certname = puppetmaster
```

agent node /etc/puppet/puppet.conf:

```shell
[agent]
server = puppetmaster
```

## Project Configuration

```shell
# on master
place project source in /etc/puppet/code/modules/deceptionagent/
place manifests/site.pp in /etc/puppet/manifests/
```

## Signing Certificates

```shell
# on agent
puppet agent -t
# on master
puppet cert sign --all
```

## Deploy

```shell
puppet agent -t
```