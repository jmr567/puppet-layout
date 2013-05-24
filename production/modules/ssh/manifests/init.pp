# ssh.pp

#include ssh

class ssh {

    $ssh_packages      = hiera('ssh_packages')
    $permit_root_login = hiera('permit_root_login')
    $ssh_users         = hiera('ssh_users')

    package { $ssh_packages:
      ensure => present,
      before => File['/etc/ssh/sshd_config'],
    }

    file { '/etc/ssh/sshd_config':
      ensure => file,
      mode   => 600,
      content => template('ssh/sshd_config.erb'),
    }

    service { 'sshd':
      ensure     => running,
      enable     => true,
      hasrestart => true,
      hasstatus  => true,
      subscribe  => File['/etc/ssh/sshd_config'],
    }

}
