class deceptionagent::service {
  service { 'deception-agent':
  enable      => true,
  ensure      => running,
}
}