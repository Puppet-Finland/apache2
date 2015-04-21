#
# == Define: apache2::module
#
# Enable an Apache2 module with a2enmod. This will not work on non-Debian 
# platforms at the moment.
#
# == Parameters
#
# [*modulename*]
#   The name of the module to enable. Defaults to resource $title.
#
# == Examples
#
#   apache2::module { 'ssl': }
#
define apache2::module
(
    $modulename = $title
)
{
    exec { "enable-apache2-module-${modulename}":
        command => "a2enmod ${modulename}",
        creates => "/etc/apache2/mods-enabled/${modulename}.load",
        path    => [ '/bin', '/usr/bin', '/usr/sbin' ],
        require => Class['apache2::install'],
    }
}
