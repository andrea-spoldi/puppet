node basenode {
  include lxc
}

node ip-*.internal inherits basenode {
  include lxc
}

