VehicleProfessions = function()

	local fireofficer = ProfessionFactory.getProfession("fireofficer");
	fireofficer:addXPBoost(Perks.VehicleDurability, 1);
	
	local policeofficer = ProfessionFactory.getProfession("policeofficer");
	policeofficer:addXPBoost(Perks.VehicleDurability, 1);
	
	local veteran = ProfessionFactory.getProfession("veteran");
	veteran:addXPBoost(Perks.VehicleDurability, 2);

	local mechanics = ProfessionFactory.getProfession("mechanics");
	mechanics:addXPBoost(Perks.VehicleDurability, 1);

	local derbydriver = ProfessionFactory.addProfession("derbydriver", getText("UI_prof_derbydriver"), "profession_derbydriver", -6);
	derbydriver:addXPBoost(Perks.Mechanics, 1);
	derbydriver:addXPBoost(Perks.Doctor, 1);
	derbydriver:addXPBoost(Perks.VehicleDurability, 3);
	derbydriver:getFreeRecipes():add("Basic Mechanics");
	derbydriver:getFreeRecipes():add("Intermediate Mechanics");
	derbydriver:getFreeRecipes():add("Advanced Mechanics");
	derbydriver:addFreeTrait("Mechanics2");

	local profList = ProfessionFactory.getProfessions()
	for i=1,profList:size() do
		local prof = profList:get(i-1)
		BaseGameCharacterDetails.SetProfessionDescription(prof)
	end
end

Events.OnGameBoot.Add(VehicleProfessions);