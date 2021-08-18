# Client configuration file (w/ Puppet)
exec {'identity file':
    command => 'echo "IdentityFile ~/.ssh/holberton" >> /etc/ssh/ssh_config',
    path    => '/bin',
}

exec { 'password off':
  command => "sed -i 's/#   PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/ssh_config",
  path    => '/bin',
}
