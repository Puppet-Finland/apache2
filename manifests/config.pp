#
# == Class: apache2::config
#
# Do basic configuration of Apache2
#
class apache2::config
(
    Boolean $purge_default_sites,
    String  $servername

) inherits apache2::params {


    if $purge_default_sites {
        file { $::apache2::params::default_sites:
            ensure => 'absent',
        }
    }

    file { 'apache2-servername':
        ensure  => present,
        name    => "${::apache2::params::conf_d_dir}/servername",
        content => template('apache2/servername.erb'),
        owner   => $::os::params::adminuser,
        group   => $::os::params::admingroup,
        mode    => '0644',
        notify  => Class['apache2::service'],
        require => Class['apache2::install'],
    }
}
