class master {
		file { "/etc/server.conf":
		content => "$server", 
		ensure => present,
		}
}
