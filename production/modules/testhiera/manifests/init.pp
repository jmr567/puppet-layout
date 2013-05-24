class testhiera {
    $testmsg = hiera("testmsg")
    file { '/tmp/testhiera.txt':
        content => inline_template("<%= testmsg %>\n"),
    }
}
