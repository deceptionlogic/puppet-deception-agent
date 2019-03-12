# Class: deceptionagent
# ===========================
#
# Full description of class deceptionagent here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'deceptionagent':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2019 Your name here, unless otherwise noted.
#

class deceptionagent (
    $key_id = $deceptionagent::params::key_id,
    $secret_key = $deceptionagent::params::secret_key,
    $log_file_retention = $deceptionagent::params::log_file_retention
  ) {

    case $::operatingsystem {
      'debian','Ubuntu': {

        case $::lsbdistcodename {
          'jessie': {
            include ::deceptionagent::debian::dependencies
            include ::deceptionagent::debian::jessie
            include ::deceptionagent::config
            include ::deceptionagent::install
            include ::deceptionagent::service
          }
          'stretch': {
            include ::deceptionagent::debian::dependencies
            include ::deceptionagent::debian::stretch
            include ::deceptionagent::config
            include ::deceptionagent::install
            include ::deceptionagent::service
          }
          'trusty': {
            include ::deceptionagent::debian::dependencies
            include ::deceptionagent::ubuntu::trusty
            include ::deceptionagent::config
            include ::deceptionagent::install
            include ::deceptionagent::service
          }
          'xenial': {
            include ::deceptionagent::debian::dependencies
            include ::deceptionagent::ubuntu::xenial
            include ::deceptionagent::config
            include ::deceptionagent::install
            include ::deceptionagent::service
          }
          'artful': {
            include ::deceptionagent::debian::dependencies
            include ::deceptionagent::ubuntu::artful
            include ::deceptionagent::config
            include ::deceptionagent::install
            include ::deceptionagent::service
          }

          default: {
            fail "Unsupported Debian version '${::lsbdistcodename}' in 'os' module"
          }
        }
        }

        'CentOS','RedHat': {
          case $::operatingsystemmajrelease {
            '6': {
              include ::deceptionagent::rhel::dependencies
              include ::deceptionagent::rhel::rhel6
              include ::deceptionagent::config
              include ::deceptionagent::install
              include ::deceptionagent::service
            }
            '7': {
              include ::deceptionagent::rhel::dependencies
              include ::deceptionagent::rhel::rhel7
              include ::deceptionagent::config
              include ::deceptionagent::install
              include ::deceptionagent::service
            }
            default: {
              fail "Unsupported RHEL/CentOS version '${::lsbdistcodename}' in 'os' module"
            }
          }
          }
          default: {
            fail "Unsupported OS ${::operatingsystem} in 'os' module"
          }
          }

          }
