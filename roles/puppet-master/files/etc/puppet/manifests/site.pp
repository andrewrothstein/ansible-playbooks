node 'labccld001' {
  class { "ntp":
    servers    => ['0.us.pool.ntp.org iburst',
                   '1.us.pool.ntp.org iburst',
                   '2.us.pool.ntp.org iburst'],
    autoupdate => false,
    restrict   => [],
    service_enable     => true,
  }

  class { 'zookeeper':
    id => 1,
    servers => ['45.32.103.20',
                '45.32.103.21',
                '45.32.103.22',
                '45.32.103.23',
                '45.32.103.24']
  }
}

node 'labccld002' {
  class { "ntp":
    servers    => [ 'labccld001' ],
    autoupdate => true,
    restrict   => [],
    service_enable     => true,
  }

  class { 'zookeeper':
    id => 2,
    servers => ['45.32.103.20',
                '45.32.103.21',
                '45.32.103.22',
                '45.32.103.23',
                '45.32.103.24']
  }
}

node 'labccld003' {
  class { "ntp":
    servers    => [ 'labccld001' ],
    autoupdate => true,
    restrict   => [],
    service_enable     => true,
  }

  class { 'zookeeper':
    id => 3,
    servers => ['45.32.103.20',
                '45.32.103.21',
                '45.32.103.22',
                '45.32.103.23',
                '45.32.103.24']
  }
}

node 'labccld004' {
  class { "ntp":
    servers    => [ 'labccld001' ],
    autoupdate => true,
    restrict   => [],
    service_enable     => true,
  }

  class { 'zookeeper':
    id => 4,
    servers => ['45.32.103.20',
                '45.32.103.21',
                '45.32.103.22',
                '45.32.103.23',
                '45.32.103.24']
  }
}

node 'labccld005' {
  class { "ntp":
    servers    => [ 'labccld001' ],
    autoupdate => true,
    restrict   => [],
    service_enable     => true,
  }

  class { 'zookeeper':
    id => 5,
    servers => ['45.32.103.20',
                '45.32.103.21',
                '45.32.103.22',
                '45.32.103.23',
                '45.32.103.24']
  }
}
