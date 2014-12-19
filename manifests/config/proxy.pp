#
# == Class: apache2::config::proxy
#
# Enabled proxy support
#
class apache2::config::proxy {

    apache2::module { 'apache2-module-proxy':
        modulename => 'proxy',
    }

}
