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
