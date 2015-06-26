#
# == Class: apache2::ldapauth
#
# Allow Apache2 to authenticate from LDAP.
#
class apache2::ldapauth inherits apache2::params {
    include ::apache2::config::ldapauth
    include ::apache2::selinux::ldapauth
}
