class location {
    $testmsg = hiera("location","production")
    file { '/etc/location':
        content => inline_template("Environemnt set by Hiera as <%= testmsg %>\n"),
	ensure => present,
    }
}

