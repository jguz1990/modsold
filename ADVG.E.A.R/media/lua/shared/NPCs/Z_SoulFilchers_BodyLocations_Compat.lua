if InsertNewLocation then
	InsertNewLocation("Bandolier", "AmmoStrap", false)
	InsertNewLocation("TorsoRig", nil, false)
	InsertNewLocation("BackRig", "Back", false)
	InsertNewLocation("CalfSheath", nil, false)
	
	HideModel["Billboard"] = {"Bandolier"}
	print("Did Soul Filchers Thing")
	
else
	local group = BodyLocations.getGroup("Human")
	group:getOrCreateLocation("TorsoRig")
	group:getOrCreateLocation("Bandolier")
	group:getOrCreateLocation("BackRig")
	group:getOrCreateLocation("CalfSheath")

end