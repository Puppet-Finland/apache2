#
# == Define: apache2::module
#
# Enable an Apache2 module with a2enmod. Will not work on non-Debian platforms 
# at the moment.
#
# == Examples
#
#   apache2::module { 'apache2-ssl-module':
#       modulename => 'ssl'
#   }
#
define apache2::module($modulename) {
    exec { "enable-apache2-module-${modulename}":
        command => "a2enmod ${modulename}",
        creates => "/etc/apache2/mods-enabled/${modulename}.load",
        path => [ '/bin', '/usr/bin', '/usr/sbin' ],
        require => Class['apache2'],
    }
}
