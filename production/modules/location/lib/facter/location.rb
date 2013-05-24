# location.rb

 Facter.add("location") do
   setcode do
       Facter::Util::Resolution.exec('/bin/cat /etc/location')
         end
         end
