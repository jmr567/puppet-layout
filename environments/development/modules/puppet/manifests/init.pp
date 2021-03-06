# puppet.pp

class puppet {

    $environment      = hiera('environment','production')
    $puppetmaster     = hiera('puppet_master','puppetmaster.example.com')
    $puppet_role      = hiera('puppet_role','client')

#work out if puppet master or client based on puppet_role fact    
    if $puppet_role == 'master' {
      
        include puppet::server
    
    } else {
        
        include puppet::client
    
    }
    
}
    
class puppet::client {
       
  package { 'puppet':
    ensure  => present,
    before => File['/etc/puppet/puppet.conf'],
  }
        
  file { '/etc/puppet/puppet.conf':
    ensure => file,
    mode   => 644,
    content => template('puppet/puppet_client.conf.erb'),
  }
        
  service { 'puppet':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    subscribe  => File['/etc/puppet/puppet.conf'],
  }

}
      
class puppet::server {
        
       
  package { ['puppet','puppet-server']:
    ensure  => present,
    before => File['/etc/puppet/puppet.conf'],
  }
        
  file { '/etc/puppet/puppet.conf':
    ensure => file,
    mode   => 644,
    content => template('puppet/puppet_server.conf.erb'),
  }

  file { '/etc/puppet/autosign.conf':
    ensure => file,
    mode   => 644,
    content => template('puppet/autosign.conf.erb'),
    before => Service['puppetmaster'],
  }

  service { ['puppet','puppetmaster']:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    subscribe  => File[['/etc/puppet/puppet.conf','/etc/puppet/autosign.conf']],
  }
      
}

