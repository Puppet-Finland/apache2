#
# == Class: apache2::service
#
# Enable apache2 on boot
#
class apache2::service
(
    Variant[Boolean, Enum['stopped','running'], Undef] $ensure

) inherits apache2::params {

    service { 'apache2-apache2':
        ensure  => $ensure,
        name    => $::apache2::params::service_name,
        enable  => true,
        require => Class['apache2::install'],
    }
}
