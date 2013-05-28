# puppet.pp

#include ssh

class puppet {

    $puppetmaster      = hiera('puppet_master','puppetmaster.example.com')
    $environment       = hiera('environment','production')

#work out if puppet master or client based on puppet_role fact    
    if $::puppet_role == 'master' {
      
        include puppet::client
    
    } else {
        
        include puppet::server
    
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
        
  service { ['puppet','puppetmaster']:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    subscribe  => File['/etc/puppet/puppet.conf'],
  }
      
}

