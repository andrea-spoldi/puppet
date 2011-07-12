class block {
        package { "bridge-utils":
            ensure => present
        }
	bridge { "br0":        
	       address => $ip,
	       ensure => "up",
	}

}
