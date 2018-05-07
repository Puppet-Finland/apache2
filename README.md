# apache2

A simple Apache2 Puppet module with optional monit and packet filtering support. 
Aimed at cases where puppetlabs-apache is simply too much.

# Module usage

Simple usage which purges default sites:

    class { '::apache2':
      purge_default_sites => true,
    }

Customize servername:

    class { '::apache2':
      servername => 'www.example.org',
    }

Enable an Apache module:

    apache2::module { 'ssl': }

