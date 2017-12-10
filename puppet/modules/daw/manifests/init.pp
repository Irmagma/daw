class daw {
	package { "lmms":
        ensure => 'installed',
	allowcdrom => true,      
 }
 	exec { 'apt-get update':
	 command => '/usr/bin/apt-get update',
	 refreshonly => true,
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
}
