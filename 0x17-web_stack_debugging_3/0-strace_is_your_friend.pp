# debug apache2

file_line { 'change name':
  ensure  => 'present',
  path    => '/var/www/html/wp-settings.php',
  replace => true,
  match   => "require_once(ABSPATH . WPINC . '/class-wp-locale.phpp'",
  line    => "require_once(ABSPATH . WPINC . '/class-wp-locale.php'",
}