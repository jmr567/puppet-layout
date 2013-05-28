# puppet_role.rb

 Facter.add("puppet_role") do
   setcode do
       Facter::Util::Resolution.exec("if `/bin/grep -qi master /etc/puppet/puppet.conf`; then echo puppetmaster ; else echo puppetclient ; fi")
         end
         end
