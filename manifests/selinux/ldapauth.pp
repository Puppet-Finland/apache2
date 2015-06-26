#
# == Class: apache2::selinux::ldapauth
#
# Configure selinux to allow Apache2 to connect to LDAP servers
#
class apache2::selinux::ldapauth inherits apache2::params {

    if $::selinux {
        selboolean { $::apache2::params::httpd_can_connect_ldap:
            value      => on,
            persistent => true,
        }
    }
}
