#
# == Class: apache2::params
#
# Defines some variables based on the operating system
#
class apache2::params {

    include ::os::params

    case $::osfamily {
        'RedHat': {
            $package_name = 'httpd'
            $config_dir = '/etc/httpd'
            $conf_d_dir = "${config_dir}/conf.d"
            $service_name = 'httpd'

            $mod_python_package_name = $::operatingsystemmajrelease ? {
                6 => 'mod_python',
                7 => 'mod_wsgi',
                default => 'mod_wsgi',
            }

            $mod_wsgi_package_name = 'mod_wsgi'
            $www_user = 'apache'
            $www_group = 'apache'
            $pidfile = '/var/run/httpd/httpd.pid'
        }
        'Debian': {
            $package_name = 'apache2'
            $config_dir = '/etc/apache2'

            case $::lsbdistcodename {
                /(trusty|jessie)/: {
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
            $www_user = 'www-data'
            $www_group = 'www-data'
        }
        default: {
            fail("Unsupported operating system ${::osfamility}")
        }
    }

    if str2bool($::has_systemd) {
        $service_start = "${::os::params::systemctl} start ${service_name}"
        $service_stop = "${::os::params::systemctl} stop ${service_name}"
    } else {
        $service_start = "${::os::params::service_cmd} ${service_name} start"
        $service_stop = "${::os::params::service_cmd} ${service_name} stop"
    }
}
