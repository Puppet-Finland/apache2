#
# == Class: apache2::config
#
# Do basic configuration of Apache2
#
class apache2::config {

    include ::apache2::params

    file { 'apache2-core':
        ensure  => present,
        name    => "${::apache2::params::conf_d_dir}/core",
        content => template('apache2/core.erb'),
        owner   => root,
        group   => root,
        mode    => '0644',
        require => Class['apache2::install'],
        notify  => Class['apache2::service'],
    }

    # Add file containing LocationMatch rules
    apache2::config::locations { 'default-locations': }

}
