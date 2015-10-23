#
# == Class: apache2::config::fragment
#
# Drop a configuration fragment to Apache2's conf.d directory
#
# == Parameters
#
# [*title*]
#   The resource $title is used as the basename of target files as well as the 
#   template.
#
define apache2::config::fragment {

    include ::apache2::params

    file { "apache2-conf.d-fragment-${title}":
        ensure  => present,
        name    => "${::apache2::params::conf_d_dir}/${title}.conf",
        content => template("apache2/${title}.conf.erb"),
        require => Class['apache2::install'],
        notify  => Class['apache2::service'],
    }
}
