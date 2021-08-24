# 2. Add a custom HTTP header with Puppet
exec { 'Update'
  command =>'apt-get update',
  path    =>'/usr/bin/',
}
package { 'nginx':
  ensure  => installed,
  require => Exec['Update'],
}
file { 'index.html':
  path    => '/var/www/html/index.html',
  ensure  => file,
  content => "Holberton School",
  require => Package['nginx'],
}
file_line { 'update default':
  path    => '/etc/nginx/sites-available/default',
  ensure  => 'present'
  line    => 'rewrite ^/redirect_me(.*)$ https://ciudadseva.com/texto/extasis/ permanent; \n}',
  after   => 'listen 80 default_server;',
  require => Package['nginx'],
}
file { 'error_404.html':
  path    => '/var/www/html/error_404.html',
  ensure  => file,
  content => "Ceci n'est pas une page",
  require => Package['nginx'],
}
file_line { 'update default 2':
  path    => '/etc/nginx/sites-available/default',
  ensure  => 'present'
  after   => 'listen 80 default_server;',
  line    => 'error_page 404 /error_404.html;',
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
