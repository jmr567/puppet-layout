# puppet.pp

#include ssh

class puppet {

    $puppetmaster      = hiera('puppet_master','puppetmaster.example.com')
    $puppet_packages   = hiera('puppet_packages','puppet')
    $puppet_services   = hiera('puppet_services','puppet')
    $environment       = hiera('environment','production')

#work out if puppet master or client based on puppet_role fact    
    if $::puppet_role == 'master' {
      $puppet_template = 'puppet/puppet_server.conf.erb'
    } else {
      $puppet_template = 'puppet/puppet_client.conf.erb'
    }
    
    package { $puppet_packages:
      ensure => present,
      before => File[$puppet_template],
    }

    file { '/etc/puppet/puppet.conf':
      ensure => file,
      mode   => 644,
      content => template($puppet_template),
    }

    service { $puppet_services:
      ensure     => running,
      enable     => true,
      hasrestart => true,
      hasstatus  => true,
      subscribe  => File[$puppet_template],
    }

}
