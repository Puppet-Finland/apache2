#
# == Class: apache2::config::fileauth
#
# Enable file-based BASIC authentication in Apache
#
class apache2::config::fileauth inherits apache2::params {

    apache2::module { 'apache2-module-authn_file':
        modulename => 'authn_file',
    }

}
