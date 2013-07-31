#
# == Class: apache2::config::python
#
# Install mod_python for Apache2
#
class apache2::config::python {

    include apache2::params

    package { 'apache2-libapache2-mod-python':
        name => "${apache2::params::mod_python_package_name}",
        ensure => installed,
    }
}
