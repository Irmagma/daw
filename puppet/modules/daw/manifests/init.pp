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
	 require => Exec['/bin/mkdir -p /tmp/needed/directory'], 
 }
	file { '/home/xubuntu/lmms':
	 ensure => 'directory',
 }
	file { '/home/xubuntu/lmms/presets':
         ensure => 'directory',
 }
	file { '/home/xubuntu/lmms/projects':
         ensure => 'directory',
 }	
	file { '/home/xubuntu/lmms/samples':
         ensure => 'directory',
 }
 	exec { 'apt-get update':
	 command => '/usr/bin/apt-get update',
	 refreshonly => true,
 }
	package { "lmms":
         ensure => 'installed',
	 allowcdrom => true,
 }

}
