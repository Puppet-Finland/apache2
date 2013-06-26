#
# == Class: apache2::monit
#
# Setup monit rules for Apache2
#
class apache2::monit(
    $monitor_email
)
{
	monit::fragment { 'apache2-apache2.monit':
		modulename => 'apache2',
	}
}
