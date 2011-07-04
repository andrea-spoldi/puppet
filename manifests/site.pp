# site.pp
notify{$servername:}
lxc { "worker3":	 
	path => "/mnt/worker3",
	conf => "/var/lib/lxc/worker3/config", 
	master => "192.168.3.1",
	ensure => absent,
}
