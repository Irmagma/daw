class daw {
	package { "lmms":
        ensure => 'installed',
	allowcdrom => true,      
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
