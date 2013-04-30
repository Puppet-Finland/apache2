#
# == Class: apache2::config
#
# Do basic configuration of Apache2
#
class apache2::config {

    include apache2::params

    file { 'apache2-core':
        name => "${apache2::params::config_dir}/conf.d/core",
        ensure => present,
        source => 'puppet:///apache2/core',
        owner => root,
        group => root,
        mode => 644,
        require => Class['apache2::install'],
        notify => Class['apache2::service'],
    }

    # Add file containing LocationMatch rules
    apache2::config::locations { 'default-locations': }

}
