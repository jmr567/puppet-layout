class location {
    $testmsg = hiera("location","production")
    file { '/etc/location':
        content => inline_template("Environment set by Hiera as <%= testmsg %>!\n"),
	ensure => present,
    }
}

