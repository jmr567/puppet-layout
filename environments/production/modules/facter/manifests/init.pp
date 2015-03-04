class facter {
  
  package { "facter":
    ensure => "latest",
  }
  
#  file { "/etc/facter/facts.d":
#    ensure => "directory",
#    owner => "root",
#    group => "root",
#    require => File["/etc/facter/facts.d"],
#  }
  
}
