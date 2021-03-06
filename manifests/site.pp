# site.pp
#notify{$servername:}
#lxc { "worker4":	 
#	path => "/mnt/worker3",
#	conf => "/var/lib/lxc/worker3/config", 
#	master => "192.168.3.1",
#	ensure => running,
#
#}

# /etc/puppet/manifests/site.pp

import "modules"
import "nodes"

#notify{$servername:}

node basenode {
        notify{$servername:}
}
node default inherits basenode {
    include apache

    $worker_ = mysqldblookup("$fqdn")
    apache::vhost { $worker_:
    port => 80,
    docroot => "/var/www/$worker_",
    ssl => false,
    priority => 10,
    serveraliases => "home.$worker_",
}
}


# The filebucket option allows for file backups to the server
filebucket { main: server => 'puppetmaster1' }

# Set global defaults - including backing up all files to the main filebucket and adds a global path
File { backup => main }
Exec { path => "/usr/bin:/usr/sbin/:/bin:/sbin" }
