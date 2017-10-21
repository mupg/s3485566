class agentconfig { 
	
	augeas { 'agent_runinterval' :
		context => '/etc/puppetlabs/puppet/puppet.conf/agent',
		changes => [ 'set runinterval 1200',],
	}

	file { '/etc/profile.d/agent_login.sh' :
		ensure => present,
		mode => '0777',
		owner => 'root',
		group => 'root',
		content => 'time=`/bin/date +"%d-%m-%Y_%H.%M.%S"`; echo "Agent run starting at $time"',
}


}
