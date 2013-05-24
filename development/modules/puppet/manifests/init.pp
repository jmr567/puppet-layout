# ssh.pp

#include ssh

class puppet {

    $puppetmaster      = hiera('puppetmaster')
    $puppet_packages   = hiera('puppet_packages')
    $puppet_services   = hiera('puppet_services')

    package { $puppet_packages:
      ensure => present,
      #before => File['/etc/ssh/sshd_config'],
    }

    #file { '/etc/ssh/sshd_config':
    #  ensure => file,
    #  mode   => 600,
    #  content => template('ssh/sshd_config.erb'),
    #}

    service { $puppet_services:
      ensure     => running,
      enable     => true,
      hasrestart => true,
      hasstatus  => true,
      #subscribe  => File['/etc/ssh/sshd_config'],
    }

}
