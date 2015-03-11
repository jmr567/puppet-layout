class ssh::config {

    file { '/etc/ssh/sshd_config':
      ensure => file,
      mode   => 600,
      content => template('ssh/sshd_config.erb'),
    }

}
