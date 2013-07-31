#
# == Class: apache2::config::fileauth
#
# Enable file-based BASIC authentication in Apache
#
class apache::config::fileauth {

    apache2::module { 'apache2-module-authn_file':
        modulename => 'authn_file',
    }

}
