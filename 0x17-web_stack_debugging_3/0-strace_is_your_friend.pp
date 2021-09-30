# debug apache2
exec { 'update':
  command  => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php; sudo service apache2 restart',
  provider => 'shell',
}