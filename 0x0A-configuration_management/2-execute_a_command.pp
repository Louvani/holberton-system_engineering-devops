# Task3
exec { 'killmenow':
  command  =>'/bin/pkill killmenow',
  provider =>'shell'
}