#
# == Class: apache2::config
#
# Do basic configuration of Apache2
#
class apache2::config {

    include ::apache2::params

    # Add file containing LocationMatch rules
    apache2::config::locations { 'default-locations': }

}
