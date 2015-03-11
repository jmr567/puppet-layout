#class ssh::params {
#  case $::osfamily {
#    Solaris: {
#      $ssh_packages = 'openssh'
#    }
#    Debian: {
#      $ssh_packages = 'openssh-server'
#    }
#    RedHat: {
#      $ssh_packages = 'openssh-server'
#    }
#    default: {
#      fail("Module ssh does not support osfamily: ${::osfamily}")
#    }
#  }
#}
