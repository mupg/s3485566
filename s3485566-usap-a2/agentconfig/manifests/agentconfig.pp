class agentconfig { 
	augeas { 'agent_runinterval' :
		context => '/etc/puppetlabs/puppet/puppet.conf/agent',
		changes => 'set runinterval 20m',
	}	
}
