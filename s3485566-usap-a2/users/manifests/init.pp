#creating users and ssh key for wilma
class user {
require groups
  user { 'becca':
ensure     => 'present',
uid        => '10015566',
home       => '/home/becca',
managehome => true,
groups     => ['sysadmin', 'cars'],
shell      => '/bin/bash',
password   => '$1$jtzisBQI$G.T/fasLfFtbEMqvCYT2h0',
#plain text is my student number
}

user { 'fred':
ensure     => 'present',
uid        => '10025566',
home       => '/home/fred',
managehome => true,
#wheel sudo group
groups     => ['trucks', 'cars', 'wheel'],
shell      => '/bin/csh',
password   => '$1$jtzisBQI$G.T/fasLfFtbEMqvCYT2h0',

}

user { 'wilma':
ensure         => 'present',
uid            => '10035566',
home           => '/home/wilma',
managehome     => true,
groups         => ['trucks', 'cars', 'ambulances'],
shell          => '/bin/bash',
password       => '$1$jtzisBQI$G.T/fasLfFtbEMqvCYT2h0',
purge_ssh_keys => true,
}
#wilma's ssh key
ssh_authorized_key { 'wilmaKey' :
ensure => 'present',
user   => 'wilma',
type   => 'ssh-rsa',
key    => 'PuBlIcKeYWilMaAa',
}
}

