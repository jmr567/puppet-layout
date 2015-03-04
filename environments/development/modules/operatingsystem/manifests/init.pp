class operatingsystem {

    $os_packages      = hiera('os_packages','packageNotListed')

    package { $os_packages:
      ensure => present,
    }


}

