exec { 'getDeps' :
        onlyif  => '/usr/bin/yum-config-manager',
        command => '/usr/bin/yum-config-manager --enable rhui-REGION-rhel-server-optional',
  }
$packages = [
	'csh','openssh-server', 'httpd', 'mysql','tigervnc-server', 
	'tmux', 'lynx', 'gcc','gdb', 'vim', 'emacs', 'wget',
  ]
package { $packages :
	ensure   => 'installed',
	provider => 'yum',
}
package { 'libxml2.so.2' :
    ensure => installed,
  }
package { 'dia2code' :
	ensure   => 'installed',
	source   => 'https://downloads.sourceforge.net/project/dia2code/dia2code/0.8.3/dia2code-0.8.3-3.1.i586.rpm?r=http%3A%2F%2Fdia2code.sourceforge.net%2Fdownload.html&ts=1507292790&use_mirror=ncu',
	provider => 'rpm',
  }
