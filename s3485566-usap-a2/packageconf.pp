class packageconf{

exec { 'runlevel' :
	command => '/usr/bin/systemctl set-default multi-user.target',
}

file { '/etc/ssh/sshd_config':
	ensure => present,
	mode => '0777',
	owner => 'root',
	group => 'root',
	source => '/etc/puppetlabs/code/environments/production/manifests/s3485566-usap-a2/sshd_config',
	require => Package['openssh-server'],
}
service { 'sshd' :
	ensure => running,
	enable => true,
	require => Package['openssh-server'],
	subscribe => File['/etc/ssh/sshd_config'],
}
file {'/var/www/s3485566':
	ensure => 'directory',
	owner  => 'root',
	mode   => '0644',
}
exec { 'becca_sudo' :
command => '/usr/sbin/usermod -aG wheel becca',
}
file {'/etc/profile.d/setuserbin.sh' :
	owner => 'root',
	mode => '0644',
	content => 'PATH=$PATH:/usr/local/bin',
}
exec { 'mount_becca_titan' :
	command => '/usr/bin/mkdir /home/becca/titan; 
	echo \ "$(cat /etc/puppetlabs/code/environments/production/manifests/ssh_passwd)"| \
	/usr/bin/sshfs -o StrictHostKeyChecking=no -o password_stdin
	s3485566@titan.csit.rmit.edu.au:/home/sh6/s3485566/ /home/becca/titan/',
	unless => '/usr/bin/find /home/becca/titan mindepth 1 | /usr/bin/read',
}

host{'titan.csit.rmit.edu.au':
        ip => '131.170.5.132',
        host_aliases => 'titan',
}
host{'saturn.csit.rmit.edu.au':
	ip => '131.170.5.132',
	host_aliases => 'saturn',
}
host{'jupiter.csit.rmit.edu.au':
	ip => '131.170.5.135',
	host_aliases => 'jupiter',
}
}
