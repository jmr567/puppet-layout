puppet-layout
=============

Sample Puppet Configuration Using Environments and Hiera with Puppet 3.7.x

Git clone to Puppet $confdir location e.g. /etc/puppet

As this is a repo containing the whole puppet configuration the idea of branching the "environments" in git is a little difficult. 

- 3 environments are included - development, staging and production (default).
- Each environment contains it's own heira data. 
- classes are defined in heiradata
- The global modules (outside the environments) are in $confdir/modules - included via common.yml.
