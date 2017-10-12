user { 'becca' :
    ensure     => present,
    uid        => '10015566',
    home       => '/home/becca',
    managehome => true,
    groups     => ['sysadmin', 'cars'],
    shell      => '/bin/bash',
  }
