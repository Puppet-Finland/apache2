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
            $www_group = 'apache'

        }
        'Debian': {
            $package_name = 'apache2'
            $config_dir = '/etc/apache2'

            case $::lsbdistcodename {
                'trusty': { $conf_d_dir = "${config_dir}/conf-enabled" }
                default:  { $conf_d_dir = "${config_dir}/conf.d" }
            }

            $service_name = 'apache2'
            $mod_python_package_name = 'libapache2-mod-python'
            $www_group = 'www-data'
        }
        default: {
            $package_name = 'apache2'
            $config_dir = '/etc/apache2'

            case $::lsbdistcodename {
                'trusty': { $conf_d_dir = "${config_dir}/conf-enabled" }
                default:  { $conf_d_dir = "${config_dir}/conf.d" }
            }

            $service_name = 'apache2'
            $mod_python_package_name = 'libapache2-mod-python'
            $www_group = 'www-data'
        }
    }
}
