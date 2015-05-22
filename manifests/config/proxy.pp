#
# == Class: apache2::config::proxy
#
# Enabled proxy support
#
class apache2::config::proxy inherits apache2::params {

    apache2::module { 'apache2-module-proxy':
        modulename => 'proxy',
    }

}
