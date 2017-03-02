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
#   Manage Apache2 using Puppet Valid values are true (default) and false.
# [*manage_config*]
#   Manage Apache2 configuration using Puppet. Valid values are true (default) 
#   and false.
# [*manage_monit*]
#   Manage monit rules. Valid values are true (default) and false.
# [*purge_default_sites*]
#   Remove default sites provided by distro packages. Valid values are true and 
#   false (default). Requires that $manage_config to be set to true to have any 
#   effect.
# [*servername*]
#   Value of ServerName directive in Apache configuration. Defaults to $::fqdn.
# [*ensure_service*]
#   Status of Apache2 service. Valid values are the same as for the ensure 
#   parameter in service resource. The default value is undef.
# [*monitor_email*]
#   Email address where local service monitoring software sends it's reports to.
#   Defaults to global variable $::servermonitor.
# [*modules*]
#   A hash of apache2::module resources to realize.
# 
# == Examples
#
#   include ::apache2
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
    Boolean $manage = true,
    Boolean $manage_config = true,
    Boolean $manage_monit = true,
            $purge_default_sites = false,
            $servername = $::fqdn,
            $ensure_service = undef,
            $monitor_email = $::servermonitor,
    Hash    $modules = {}
)
{

if $manage {

    include ::webserver
    include ::apache2::install
    create_resources('apache2::module', $modules)

    if $manage_config {
        class { '::apache2::config':
            purge_default_sites => $purge_default_sites,
            servername          => $servername,
        }

        include ::apache2::config::setenvif
    }

    class { '::apache2::service':
        ensure => $ensure_service,
    }

    if $manage_monit {
        class { '::apache2::monit':
            monitor_email => $monitor_email,
        }
    }
}
}
