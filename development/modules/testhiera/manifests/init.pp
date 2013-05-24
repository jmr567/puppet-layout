class testhiera {
    $testmsg = hiera("testmsg")
    file { '/tmp/testhiera.txt':
        content => inline_template("<%= testmsg %>\n"),
    }
    $location = hiera("location")
    file { '/tmp/classestest.txt':
        content => inline_template("<%= location %>\n"),
    }
}
