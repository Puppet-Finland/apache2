#
# == Class: apache2::config::setenvif
#
# Generic browser-specific tunings
#
class apache2::config::setenvif inherits apache2::params {

    apache2::config::fragment { 'setenvif': }
}
