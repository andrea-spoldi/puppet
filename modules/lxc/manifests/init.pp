$puppet_manifests_main= "/etc/puppet/manifests/"
$puppet_modules_dir= "/etc/puppet/modules/"

class vm {

    file { "${puppet_manifests_main}":
        owner   => root,
        group   => root,
        mode    => 440,
        source  => "puppet:///vm/init.pp",
    }
}
