function Accept_Bullets(container, item)
	--print("TEST")
	--print(tostring(item:getDisplayCategory()))
	--print(tostring(item:getDisplayName():contains("Round") or item:getCategory()=="Ammo") and not (item:getDisplayName():contains("Rounds")) and not item:getDisplayName():contains("Shotgun"))
	--return ( (item:getDisplayName():contains("Round") or item:getCategory()=="Ammo") and not (item:getDisplayName():contains("Rounds")) and not item:getDisplayName():contains("Shotgun") )
	return  item:getDisplayCategory()=="Ammo" and not item:getDisplayName():contains("Shotgun")
end 

function Accept_Shells(container, item)
	--print("TEST")
	--print(item:getType() == "ShotgunShells")
	return item:getType() == "ShotgunShells"
end
