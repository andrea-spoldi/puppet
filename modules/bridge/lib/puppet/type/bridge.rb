Puppet::Type.newtype(:bridge) do
    @doc = "manage network bridge"
 
	ensurable do 
		newvalue(:up) do
			provider.up
		end
		newvalue(:set) do 
			provider.create
		end
		newvalue(:down) do 
			provider.delete
		end
	defaultto :set 

	end
    newparam(:name) do
        desc "bridge Id"
 	isnamevar
    end
    newparam(:address) do
	desc "bridge IPv4 Address"
	end
    newparam(:status) do
	desc "bridge link status"
    	end
end
