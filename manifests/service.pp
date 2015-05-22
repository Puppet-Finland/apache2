#
# == Class: apache2::service
#
# Enable apache2 on boot
#
class apache2::service {

    include ::apache2::params

    service { 'apache2-apache2':
        name    => $::apache2::params::service_name,
        enable  => true,
        require => Class['apache2::install'],
    }
}
