# puppet_role.rb

 Facter.add("puppet_role") do
   setcode do
       Facter::Util::Resolution.exec('/bin/cat /etc/location')
         end
         end
