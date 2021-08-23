# 2. Add a custom HTTP header with Puppet
package { 'nginx':
	ensure => installed,
}
file { 'index.html':
	path    => '/var/www/html/index.html',
	ensure  => file,
	content => "Holberton School"
}
exec { 'start nginx'
	command  =>'sudo service nginx start'
	provider =>'shell'
}
exec { 'update default':
  command => "sudo sed -i '/server_name _;/a location /redirect_me {\n     rewrite ^/redirect_me(.*)$ https://ciudadseva.com/texto/extasis/ permanent; \n}' /etc/nginx/sites-available/default",
  path    => '/bin',
}
exec { 'set page 404'
	command  =>'sudo echo "Ceci n'est pas une page" | sudo tee /var/www/html/error_404.html'
	provider =>'shell'
}
exec { 'update default'
	command  =>'sudo sed -i '/listen 80 default_server/a error_page 404 /error_404.html;' /etc/nginx/sites-available/default'
	provider =>'shell'
}
exec { 'restart nginx'
	command  =>'sudo service nginx restart'
	provider =>'shell'
}
exec { 'update default add header'
	command  =>'sed -i "/listen 80 default_server;/a add_header X-Served-By ${HOSTNAME};" /etc/nginx/sites-available/default'
	provider =>'shell'
}
