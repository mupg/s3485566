user { 'becca' :
    ensure     => present,
    uid        => '10015566',
    home       => '/home/becca',
    managehome => true,
    groups     => ['sysadmin', 'cars'],
    shell      => '/bin/bash',
  }

user { 'fred' :
    ensure     => present,
    uid        => '10025566',
    home       => '/home/fred',
    managehome => true,
    groups     => ['trucks', 'cars', 'wheel'],
    shell      => '/bin/csh',
  }

  user { 'wilma' :
    ensure         => present,
    uid            => '10035566',
    home           => '/home/wilma',
    managehome     => true,
    groups         => ['trucks', 'cars', 'ambulances'],
    shell          => '/bin/bash',
    purge_ssh_keys => true,
  }
