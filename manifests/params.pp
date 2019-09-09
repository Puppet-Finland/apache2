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

            # SELinux settings
            $httpd_can_connect_ldap = 'httpd_can_connect_ldap'
        }
        'Debian': {
            $package_name = 'apache2'
            $config_dir = '/etc/apache2'
            $sites_dir = "${config_dir}/sites-enabled"

            case $::lsbdistcodename {
                /(precise|wheezy)/: {
                    $conf_d_dir = "${config_dir}/conf.d"
                    $pidfile = '/var/run/apache2.pid'
                }
                default: {
                    $conf_d_dir = "${config_dir}/conf-enabled"
                    $pidfile = '/var/run/apache2/apache2.pid'
                }
            }

            $mod_php_package_name = $::lsbdistcodename ? {
                'xenial' => 'libapache2-mod-php',
                'bionic' => 'libapache2-mod-php7.2',
                default  => 'libapache2-mod-php5',
            }

            $service_name = 'apache2'
            $mod_python_package_name = 'libapache2-mod-python'
            $mod_wsgi_package_name = 'libapache2-mod-wsgi'
            $www_user = 'www-data'
            $www_group = 'www-data'

            $default_sites = ["${sites_dir}/000-default.conf", "${sites_dir}/default-ssl.conf"]

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
