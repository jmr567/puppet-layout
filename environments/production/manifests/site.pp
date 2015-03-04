hiera_include('classes')

#Fix Puppet Bug
if versioncmp($::puppetversion, '3.6.0') >= 0 {
  Package {
    allow_virtual => false,
  }
}

