# environment.rb

 Facter.add("environment") do
   setcode do
       Facter::Util::Resolution.exec('/bin/cat /etc/environment')
         end
         end

