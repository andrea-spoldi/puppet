# /etc/puppet/modules/lxc/manifests/init.pp

class lxc_host {
	package {["lxc", "debootstrap","bridge-utils","dnsmasq"];
		ensure => installed; 
		}
}
