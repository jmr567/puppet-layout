class devapp3 {

 file {'/tmp/devapp3':
      path    => '/tmp/devapp3',
      ensure  => present,
      mode    => 0640,
      content => "I'm a DevApp3.",
    }
    
 file {'/tmp/devapp3_database.conf':
      path    => '/tmp/devapp3_database.conf',
      ensure  => present,
      mode    => 0640,
      content => template(devapp3_database.comf.erb),
 }

}
