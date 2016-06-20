#
# == Class: apache2::config::php
#
# Enable php for Apache
#
class apache2::config::php inherits apache2::params {

    package { 'apache2-libapache2-mod-php':
        ensure => 'present',
        name   => $::apache2::params::mod_php_package_name,
    }
}
