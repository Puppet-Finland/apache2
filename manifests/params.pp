#
# == Class: apache2::params
#
# Defines some variables based on the operating system
#
class apache2::params {

    case $::osfamily {
        'RedHat': {
            $package_name = 'httpd'
            $config_dir = '/etc/httpd'
            $service_name = 'httpd'
            $mod_python_package_name = 'mod_python'
            $mod_wsgi_package_name = 'mod_wsgi'
            $www_group = 'apache'
            $pidfile = '/var/run/httpd/httpd.pid'

            if $::operatingsystem == 'Fedora' {
                $service_start = "/usr/bin/systemctl start \
                                  ${service_name}.service"
                $service_stop = "/usr/bin/systemctl stop \
                                 ${service_name}.service"
            } else {
                $service_start = "/sbin/service ${service_name} start"
                $service_stop = "/sbin/service ${service_name} stop"
            }
        }
        'Debian': {
            $package_name = 'apache2'
            $config_dir = '/etc/apache2'

            case $::lsbdistcodename {
                'trusty': {
                    $conf_d_dir = "${config_dir}/conf-enabled"
                    $pidfile = '/var/run/apache2/apache2.pid'
                }
                default: {
                    $conf_d_dir = "${config_dir}/conf.d"
                    $pidfile = '/var/run/apache2.pid'
                }
            }

            $service_name = 'apache2'
            $mod_python_package_name = 'libapache2-mod-python'
            $mod_wsgi_package_name = 'libapache2-mod-wsgi'
            $www_group = 'www-data'
            $service_start = "/usr/sbin/service ${service_name} start"
            $service_stop = "/usr/sbin/service ${service_name} stop"
        }
        default: {
            $package_name = 'apache2'
            $config_dir = '/etc/apache2'

            case $::lsbdistcodename {
                'trusty': {
                    $conf_d_dir = "${config_dir}/conf-enabled"
                    $pidfile = '/var/run/apache2/apache2.pid'
                }
                default: {
                    $conf_d_dir = "${config_dir}/conf.d"
                    $pidfile = '/var/run/apache2.pid'
                }
            }

            $service_name = 'apache2'
            $mod_python_package_name = 'libapache2-mod-python'
            $mod_wsgi_package_name = 'libapache2-mod-wsgi'
            $www_group = 'www-data'
            $service_start = "/usr/sbin/service ${service_name} start"
            $service_stop = "/usr/sbin/service ${service_name} stop"
        }
    }
}
