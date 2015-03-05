class global {

 file {'/tmp/global':
      path    => '/tmp/global',
      ensure  => present,
      mode    => 0640,
      content => "I'm a Global File.",
    }

}

