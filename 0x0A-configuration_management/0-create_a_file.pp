# Task0
file { '/tmp/holberton':
  ensure  =>'file',
  mode    =>'0744',
  owner   =>'www-data',
  group   =>'www-data',
  content =>'I love Puppet',
}