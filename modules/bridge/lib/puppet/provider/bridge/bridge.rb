require 'fileutils'
Puppet::Type.type(:bridge).provide(:bridge) do 
	commands :brctl => "/usr/sbin/brctl"
	commands :ifconfig => "/sbin/ifconfig"

	def create # Create a user in the file we opened in the mech method 
    		brctl "addbr", resource[:name]
		brctl "setfd", resource[:name], "0"
        end
        
        def destroy
	end

	def up
		create
		ifconfig resource[:name], resource[:address], "up"
	end

	def stop
	end

	def exists?
	  File.exists?(resource[:name])
	end
end
