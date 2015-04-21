#
# == Class: apache2
#
# This class installs and configures Apache2. The "webserver" class is included 
# to handle generic webserver configuration not tied specifically to Apache2 - 
# in practice opening ports 80 and 443 in the firewall.
#
# This module is simple and unparameterized by design. The idea is that more 
# advanced configurations will be implemented from within other Puppet modules 
# using virtualhost definitions and conf.d configuration file fragments.
#
# == Parameters
#
# [*manage*]
#   Whether to manage Apache2 using Puppet or not. Valid values 'yes' (default) 
#   and 'no'.
# [*monitor_email*]
#   Email address where local service monitoring software sends it's reports to.
#   Defaults to global variable $::servermonitor.
# [*modules*]
#   A hash of apache2::module resources to realize.
# 
# == Examples
#
#   include apache2
# 
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# Samuli Seppänen <samuli@openvpn.net>
#
# == License
#
# BSD-license. See file LICENSE for details.
#
class apache2
(
    $manage = 'yes',
    $monitor_email = $::servermonitor,
    $modules = {}
)
{

if $manage == 'yes' {

    include webserver
    include apache2::install
    include apache2::config
    include apache2::service

    create_resources('apache2::module', $modules)

    if tagged('monit') {
        class { 'apache2::monit':
            monitor_email => $monitor_email,
        }
    }
}
}
