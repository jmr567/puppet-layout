class location {
    $testmsg = hiera("location","production")
    file { '/etc/location':
        content => inline_template("<%= testmsg %>\n"),
	ensure => present,
    }
}

