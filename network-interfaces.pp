define network-interfaces-tmpl ($style, $ip, $broadcast = "xx.xx.xx.xx", $gateway = "xx.xx.xx.xx") {
        file { "/etc/network/interfaces":
                owner => root,
                group => root,
                mode => 644,
                content => template("network/$style")
        }
}
