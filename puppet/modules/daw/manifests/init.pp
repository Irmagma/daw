class daw {

	exec {'retrieve_kxstudio-repos_9.4.6~kxstudio1_all.deb':
	 command => "/usr/bin/wget -q https://launchpad.net/~kxstudio-debian/+archive/kxstudio/+files/kxstudio-repos_9.4.6~kxstudio1_all.deb -O /home/xubuntu/kxstudio-repos_9.4.6~kxstudio1_all.deb",
 	 before => Exec['sudo dpkg'],
	}		 
	exec {'retrieve_kxstudio-repos-gcc5_9.4.6~kxstudio1_all.deb':
	 command => "/usr/bin/wget -q https://launchpad.net/~kxstudio-debian/+archive/kxstudio/+files/kxstudio-repos-gcc5_9.4.6~kxstudio1_all.deb -O /home/xubuntu/kxstudio-repos-gcc5_9.4.6~kxstudio1_all.deb",
	 before => Exec['sudo dpkg'],	
	}
	exec {'sudo dpkg':
	 command => "/usr/bin/dpkg -i /home/xubuntu/kxstudio-repos_9.4.6~kxstudio1_all.deb ; /usr/bin/dpkg -i /home/xubuntu/kxstudio-repos-gcc5_9.4.6~kxstudio1_all.deb", 
	}
	file { '/home/xubuntu/lmms':
	 ensure => 'directory',
	 before => Exec['lmms'],
	}
	file { '/home/xubuntu/lmms/presets':
         ensure => 'directory',
	 before => Exec['lmms'],
	}
	file { '/home/xubuntu/lmms/projects':
         ensure => 'directory',
	 before => Exec['lmms'],
	}	
	file { '/home/xubuntu/lmms/samples':
         ensure => 'directory',
	 before => Exec['lmms'],
	}
 	exec { 'apt-get update':
	 command => '/usr/bin/apt-get update',
	 require => Exec['sudo dpkg'],
	 notify => Package['lmms'],
	}
	package { "lmms":
         ensure => 'installed',
	 allowcdrom => true,
	}
 	exec { 'lmms':
	 command => "/usr/bin/lmms",
	 require => Package['lmms'],
	}
}
