#
# == Class: apache2::install
#
# Installs Apache2
#
class apache2::install {

    include ::apache2::params

    package { 'apache2-apache2':
        ensure => installed,
        name   => $::apache2::params::package_name,
    }
}
