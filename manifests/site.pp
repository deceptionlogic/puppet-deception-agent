node default {
  class { '::deceptionagent':
  	key_id => 'sdvshdc',
  	secret_key => 'sfrwgrg',
  	log_file_retention => '15',
  }
}
