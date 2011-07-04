Puppet::Type.newtype(:lxc) do
    @doc = "manage lxc"
 
	ensurable do 
		newvalue(:present) do
			provider.create
		end
		newvalue(:absent) do 
			provider.destroy
		end
		newvalue(:running) do 
			provider.start
		end
		newvalue(:halted) do
			provider.stop
		end
	defaultto :present 

	end
    newparam(:name) do
        desc "loft name"
 	isnamevar
    end
    newparam(:path) do
	desc "rootfs path"
	end
    newparam(:conf) do
	desc "puppetmaster"
    	end
    newparam(:master) do
	desc "loft config file"
        end
 
end
