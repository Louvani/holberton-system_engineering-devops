# 2. Add a custom HTTP header with Puppet
exec { 'Update'
  command =>'apt-get update',
  path    =>'/usr/bin/',
}
package { 'nginx':
  ensure  => installed,
  require => Exec['Update'],
}
file { '/var/www/html/index.html':
  content => "Holberton School",
  require => Package['nginx'],
}
file_line { 'update default':
  path    => '/etc/nginx/sites-available/default',
  ensure  => 'present'
  line    => 'rewrite ^/redirect_me(.*)$ https://ciudadseva.com/texto/extasis/ permanent;}',
  after   => 'listen 80 default_server;',
  require => Package['nginx'],
}
file_line { 'update default 3':
  ensure  => 'present'
  path    => '/etc/nginx/sites-available/default',
  after   => 'listen 80 default_server;',
  line    => 'add_header X-Served-By ${HOSTNAME};',
  require => Package['nginx'],
}
service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}

