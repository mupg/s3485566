#create groups
class groups {
group{'cars':
	ensure => present,
	gid    => '1004',
}
  
group{'sysadmin':
	ensure => present,
	gid    => '1005',
}

group{'trucks':
	ensure => present,
	gid    => '1006',
}

group{'ambulances':
	ensure => present,
	gid    => '1007',
}
}
