require 'fileutils'
Puppet::Type.type(:lxc).provide(:lxc) do 
	
	commands :lxc_create => "/usr/bin/lxc-worker"
	commands :lxc_destroy => "/usr/bin/lxc-destroy"
	commands :lxc_start => "/usr/bin/lxc-start"
	commands :lxc_stop => "/usr/bin/lxc-stop"
	commands :lxc_info => "/usr/bin/lxc-info"

	def create # Create a user in the file we opened in the mech method 
    		lxc_create "-p", resource[:path], "-n", resource[:name], "-m", resource[:master]
        end
        
        def destroy
        	stop
		lxc_destroy "-n", resource[:name]
	end

	def start
		create
		lxc_start "-n", resource[:name], "-d"
	end

	def stop
		lxc_stop "-n", resource[:name]
	end

	def exists?
	  File.exists?(resource[:conf])
	end
end
