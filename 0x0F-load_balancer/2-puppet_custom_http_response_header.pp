# 2. Add a custom HTTP header with Puppet
exec { 'Update'
	command =>'apt-get update',
	path    =>'/usr/bin/',
}
package { 'nginx':
	ensure  => installed,
	require => exec['Update'],
}
file { 'index.html':
	path    => '/var/www/html/index.html',
	ensure  => file,
	content => "Holberton School",
	require => package['nginx'],
}
file_line { 'update default':
	path    => '/etc/nginx/sites-available/default',
	line    => 'location /redirect_me {\n     rewrite ^/redirect_me(.*)$ https://ciudadseva.com/texto/extasis/ permanent; \n}',
	after   => 'server_name _;',
	require => package['nginx'],
}
file { 'error_404.html':
	path    => '/var/www/html/error_404.html',
	line    => 'Ceci n'est pas une page',
	ensure  => file,
	content => 'Ceci n'est pas une page',
	require => package['nginx'],
}
file_line { 'update default 2':
	path    => '/etc/nginx/sites-available/default',
	line    => 'error_page 404 /error_404.html;',
	after   => 'listen 80 default_server',
	require => package['nginx'],
}
file_line { 'update default 3':
	path    => '/etc/nginx/sites-available/default',
	line    => 'add_header X-Served-By ${HOSTNAME};',
	after   => 'listen 80 default_server',
	require => package['nginx'],
}
service {
	ensure  => running,
	require => package['nginx'],
}
