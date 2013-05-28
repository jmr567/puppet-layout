# ssh.pp

#include ssh

class puppet {

    $puppetmaster      = hiera('puppet_master')
    $puppet_packages   = hiera('puppet_packages')
    $puppet_services   = hiera('puppet_services')
    $environment       = hiera('environment','production')

    package { $puppet_packages:
      ensure => present,
      before => File['/etc/puppet/puppet.conf'],
    }

    file { '/etc/puppet/puppet.conf':
      ensure => file,
      mode   => 644,
      content => template('puppet/puppet_client.conf.erb'),
    }

    service { $puppet_services:
      ensure     => running,
      enable     => true,
      hasrestart => true,
      hasstatus  => true,
      subscribe  => File['/etc/puppet/puppet.conf'],
    }

}
