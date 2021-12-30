if InsertNewLocation then
	InsertNewLocation("RifleSling", nil, false)
	
	print("Did Soul Filchers Thing")
	
else
	local group = BodyLocations.getGroup("Human")
	group:getOrCreateLocation("RifleSling")
end