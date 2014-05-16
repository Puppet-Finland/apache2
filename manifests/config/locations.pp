#
# == Define: apache2::config::locations
#
# Add a block directive, e.g. to limit exposure of sensitive URLs to only given 
# hosts/IPs.
#
define apache2::config::locations(
    $location_lines=['']
)
{

    include apache2::params

    file { 'apache2-locations':
        name => "${apache2::params::conf_d_dir}/locations",
        ensure => present,
        content => template('apache2/locations.erb'),
        owner => root,
        group => root,
        mode => 644,
        require => Class['apache2::install'],
        notify => Class['apache2::service'],
    }      
}
