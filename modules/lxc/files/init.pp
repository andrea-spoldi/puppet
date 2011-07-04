class php5-fpm {
    file { "/var/www":
	ensure => directory,
	}
    package { php5-fpm: 
	ensure => installed,
	require => File["/var/www"],
	}
}
class squashfs {
	package { squashfs-tools:
        ensure => installed,
        }
}
