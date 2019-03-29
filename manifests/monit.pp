#
# == Class: apache2::monit
#
# Setup monit rules for Apache2
#
class apache2::monit
(
    String $monitor_email
)
{
  @monit::fragment { 'apache2-apache2.monit':
    basename   => 'apache2',
    modulename => 'apache2',
    tag        => 'default',
  }
}
