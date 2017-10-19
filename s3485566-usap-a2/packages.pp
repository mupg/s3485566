$packages = [
	'csh','openssh-server', 'httpd', 'mysql','tigervnc-server', 
	'tmux', 'lynx', 'gcc','gdb', 'vim', 'emacs', 
  ]
package { $packages :
	ensure   => 'installed',
	provider => 'yum',
}





