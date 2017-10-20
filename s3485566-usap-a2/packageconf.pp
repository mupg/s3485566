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


}
