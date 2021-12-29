require "Items/Distributions"
require "Items/ItemPicker"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"


	-- table.insert(SuburbsDistributions["gunstore"]["locker"].items, "Base.CalfSheath");
	-- table.insert(SuburbsDistributions["gunstore"]["locker"].items, 0.1);
	
	-- table.insert(SuburbsDistributions["gunstore"]["metal_shelves"].items, "Base.CalfSheath");
	-- table.insert(SuburbsDistributions["gunstore"]["metal_shelves"].items, 0.1);
	
	-- table.insert(SuburbsDistributions["gunstorestorage"]["all"].items, "Base.CalfSheath");
	-- table.insert(SuburbsDistributions["gunstorestorage"]["all"].items, 0.1);	
	
	table.insert(ProceduralDistributions.list["GunStoreShelf"].items, "Base.CalfSheath");
	table.insert(ProceduralDistributions.list["GunStoreShelf"].items, 0.1);
	
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, "Base.CalfSheath");
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, 0.1);
	
	table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "Base.CalfSheath");
	table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 0.1);
	
	table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "Base.CalfSheath");
	table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 0.1);
	
	table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "Base.CalfSheath");
	table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 0.1);
	

	table.insert(ProceduralDistributions.list["MeleeWeapons"].items, "Base.CalfSheath");
	table.insert(ProceduralDistributions.list["MeleeWeapons"].items, 1);
	
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, "Base.CalfSheath");
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, 1);
	
	-- table.insert(SuburbsDistributions["armysurplus"]["shelves"].items, "Base.CalfSheath");
	-- table.insert(SuburbsDistributions["armysurplus"]["shelves"].items, 1);
	
	-- table.insert(SuburbsDistributions["armysurplus"]["shelves"].items, "Base.CalfSheath");
	-- table.insert(SuburbsDistributions["armysurplus"]["shelves"].items, 1);	
	
	if ProceduralDistributions.list.ArmySurplusTools then	
		table.insert(ProceduralDistributions.list["ArmySurplusTools"].items, "Base.CalfSheath");
		table.insert(ProceduralDistributions.list["ArmySurplusTools"].items, 1);	
	end	
		
	table.insert(VehicleDistributions["SurvivalistTruckBed"].items, "Base.CalfSheath");
	table.insert(VehicleDistributions["SurvivalistTruckBed"].items, 0.5);	