# Task3
exec { 'killmenow':
  command  =>'/usr/bin/pkill killmenow',
  provider =>'shell'
}