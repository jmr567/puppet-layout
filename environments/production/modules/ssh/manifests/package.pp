class ssh::packages {

    package { $ssh_packages:
      ensure => present,
      before => File['/etc/ssh/sshd_config'],
    }

}
