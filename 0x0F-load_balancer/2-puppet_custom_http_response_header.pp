# 2. Add a custom HTTP header with Puppet
exec { 'apt-get-update':
  command =>'/usr/bin/apt-get update',
}
package { 'nginx':
  ensure  => installed,
  require => Exec['apt-get-update'],
}
file_line { 'f':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default',
  after   => 'listen 80 default_server;',
  line    => 'rewrite ^/redirect_me https://ciudadseva.com/texto/extasis/ permanent;',
  require => Package['nginx'],
}
file_line { 's':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default',
  after   => 'listen 80 default_server;',
  line    => 'add_header X-Served-By $hostname;',
  require => Package['nginx'],
}
file { '/var/www/html/index.html':
  content => "Holberton School",
  require => Package['nginx'],
}
service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
