# 2. Add a custom HTTP header with Puppet
package { 'nginx':
  ensure  => installed,
}
file_line { 'Add redirection, 301':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default',
  after   => 'listen 80 default_server;',
  line    => 'rewrite ^/redirect_me https://ciudadseva.com/texto/extasis/ permanent;',
}
file { '/var/www/html/index.html':
  content => "Holberton School",
}
service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
