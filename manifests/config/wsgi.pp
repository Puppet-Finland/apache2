#
# == Class: apache2::config::wsgi
#
# Install Apache2 mod_wsgi to support WSGI-compatible Python webapps.
#
class apache2::config::wsgi {

    include ::apache2::params

    package { 'apache2-libapache2-mod-wsgi':
        ensure => installed,
        name   => $::apache2::params::mod_wsgi_package_name,
    }
}
