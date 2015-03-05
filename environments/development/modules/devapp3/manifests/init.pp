class devapp3 {
  
    #$environment       = comes from facter
    $devapp3_url       = hiera('devapp3_url','noURLstring')
    $devapp3_database  = hiera('devapp3_database','noDBstring')

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
      content => template('devapp3/devapp3_database.conf.erb'),
 }

}
