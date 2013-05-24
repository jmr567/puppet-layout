class devapp2 {

 file {'/tmp/devapp2':
      path    => '/tmp/devapp2',
      ensure  => present,
      mode    => 0640,
      content => "I'm a DevApp2.",
    }

}
