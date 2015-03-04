    hiera_include('classes')

if versioncmp($::puppetversion, '3.6.0') >= 0 {
  Package {
    allow_virtual => false,
  }
}

