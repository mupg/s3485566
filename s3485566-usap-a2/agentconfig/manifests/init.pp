#agent configuration interval check and time stamp
class agentconfig {
#set interval to 20min
exec { 'sudo /usr/local/bin/puppet agent --runinterval 1200':
path => ['/usr/bin', '/usr/sbin','/usr/local/bin'],
}
#timestamp for login
file { '/etc/profile.d/agent_login.sh' :
ensure  => present,
mode    => '0777',
owner   => 'root',
group   => 'root',
content => 'time=`/bin/date +"%d-%m-%Y_%H.%M.%S"`; echo "Agent run starting at $time"',
}
}

