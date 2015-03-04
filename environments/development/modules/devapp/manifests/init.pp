class devapp {

 file {'/tmp/devapp':
      path    => '/tmp/devapp',
      ensure  => present,
      mode    => 0640,
      content => "I'm a DevApp.",
    }

}
