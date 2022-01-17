require "Items/Distributions"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"
require "Items/ItemPicker"	

	
	-- table.insert(SuburbsDistributions["camping"]["counter"].items, "Base.Compass");
	-- table.insert(SuburbsDistributions["camping"]["counter"].items, 0.25);
	-- table.insert(SuburbsDistributions["camping"]["counter"].items, "Base.Compass2");
	-- table.insert(SuburbsDistributions["camping"]["counter"].items, 0.25);	
	-- table.insert(SuburbsDistributions["camping"]["counter"].items, "Base.CliponCompass");
	-- table.insert(SuburbsDistributions["camping"]["counter"].items, 0.05);	
	-- table.insert(SuburbsDistributions["camping"]["shelves"].items, "Base.Compass");
	-- table.insert(SuburbsDistributions["camping"]["shelves"].items, 0.25);
	-- table.insert(SuburbsDistributions["camping"]["shelves"].items, "Base.Compass2");
	-- table.insert(SuburbsDistributions["camping"]["shelves"].items, 0.25);	
	-- table.insert(SuburbsDistributions["camping"]["shelves"].items, "Base.CliponCompass");
	-- table.insert(SuburbsDistributions["camping"]["shelves"].items, 0.05);
	
	-- table.insert(SuburbsDistributions["generalstore"]["other"].items, "Base.Compass");
	-- table.insert(SuburbsDistributions["generalstore"]["other"].items, 0.25);	
	-- table.insert(SuburbsDistributions["generalstore"]["other"].items, "Base.Compass2");
	-- table.insert(SuburbsDistributions["generalstore"]["other"].items, 0.25);		
	-- table.insert(SuburbsDistributions["generalstore"]["other"].items, "Base.CliponCompass");
	-- table.insert(SuburbsDistributions["generalstore"]["other"].items, 0.05)
	--ProceduralDistributions.list
	-- table.insert(SuburbsDistributions["hunting"]["locker"].items, "Base.Compass");
	-- table.insert(SuburbsDistributions["hunting"]["locker"].items, 0.25);	
	-- table.insert(SuburbsDistributions["hunting"]["locker"].items, "Base.Compass2");
	-- table.insert(SuburbsDistributions["hunting"]["locker"].items, 0.25);	
	-- table.insert(SuburbsDistributions["hunting"]["locker"].items, "Base.CliponCompass");
	-- table.insert(SuburbsDistributions["hunting"]["locker"].items, 0.05);
	
	table.insert(ProceduralDistributions.list["CampingStoreGear"].items, "Base.Compass");
	table.insert(ProceduralDistributions.list["CampingStoreGear"].items, 0.25);	
	table.insert(ProceduralDistributions.list["CampingStoreGear"].items, "Base.Compass2");
	table.insert(ProceduralDistributions.list["CampingStoreGear"].items, 0.25);	
	table.insert(ProceduralDistributions.list["CampingStoreGear"].items, "Base.CliponCompass");
	table.insert(ProceduralDistributions.list["CampingStoreGear"].items, 0.05);
	
	-- table.insert(SuburbsDistributions["armystorage"]["locker"].items, "Base.Compass2");
	-- table.insert(SuburbsDistributions["armystorage"]["locker"].items, 0.1);		
	-- table.insert(SuburbsDistributions["armystorage"]["locker"].items, "Base.WristCompass_Left");
	-- table.insert(SuburbsDistributions["armystorage"]["locker"].items, 0.01);
	
	-- table.insert(SuburbsDistributions["armyhanger"]["locker"].items, "Base.Compass2");
	-- table.insert(SuburbsDistributions["armyhanger"]["locker"].items, 0.1);	
	-- table.insert(SuburbsDistributions["armyhanger"]["locker"].items, "Base.WristCompass_Left");
	-- table.insert(SuburbsDistributions["armyhanger"]["locker"].items, 0.01);
			
	table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, "Base.Compass2");
	table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, 0.1);		
	table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, "Base.WristCompass_Left");
	table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, 0.01);
	
	-- table.insert(SuburbsDistributions["armysurplus"]["metal_shelves"].items, "Base.Compass2");
	-- table.insert(SuburbsDistributions["armysurplus"]["metal_shelves"].items, 0.1);	
	-- table.insert(SuburbsDistributions["armysurplus"]["metal_shelves"].items, "Base.WristCompass_Left");
	-- table.insert(SuburbsDistributions["armysurplus"]["metal_shelves"].items, 0.01);	
	
	-- table.insert(SuburbsDistributions["armysurplus"]["shelves"].items, "Base.Compass2");
	-- table.insert(SuburbsDistributions["armysurplus"]["shelves"].items, 0.1);	
	-- table.insert(SuburbsDistributions["armysurplus"]["shelves"].items, "Base.WristCompass_Left");
	-- table.insert(SuburbsDistributions["armysurplus"]["shelves"].items, 0.01);
	
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, "Base.Compass2");
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, 0.1);	
	
	table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "Base.Compass2");
	table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 50);
	
	table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "Base.Compass2");
	table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 0.1);	
	table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "Base.WristCompass_Left");
	table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 0.01);	
	
	table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "Base.Compass2");
	table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 0.1);	
	table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "Base.WristCompass_Left");
	table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 0.01);
	
	
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, "Base.Compass2");
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, 10);	
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, "Base.WristCompass_Left");
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, 1);		

	table.insert(SuburbsDistributions["Bag_ALICEpack_Army"].items, "Base.Compass2");
	table.insert(SuburbsDistributions["Bag_ALICEpack_Army"].items, 10);	

	table.insert(SuburbsDistributions["Bag_ALICEpack"].items, "Base.Compass2");
	table.insert(SuburbsDistributions["Bag_ALICEpack"].items, 10);	

	table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Compass2");
	table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 1);
	
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, "Base.Compass2");
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, 1);
	
	table.insert(VehicleDistributions["SurvivalistTruckBed"].items, "Base.Compass2");
	table.insert(VehicleDistributions["SurvivalistTruckBed"].items, 1);	
	table.insert(VehicleDistributions["HunterTruckBed"].items, "Base.Compass2");
	table.insert(VehicleDistributions["HunterTruckBed"].items, 1);	
	table.insert(VehicleDistributions["RangerTruckBed"].items, "Base.Compass2");
	table.insert(VehicleDistributions["RangerTruckBed"].items, 1);	
	table.insert(VehicleDistributions["FishermanTruckBed"].items, "Base.Compass2");
	table.insert(VehicleDistributions["FishermanTruckBed"].items, 1);	
	table.insert(VehicleDistributions["SurvivalistTruckBed"].items, "Base.Compass");
	table.insert(VehicleDistributions["SurvivalistTruckBed"].items, 1);	
	table.insert(VehicleDistributions["HunterTruckBed"].items, "Base.Compass");
	table.insert(VehicleDistributions["HunterTruckBed"].items, 1);	
	table.insert(VehicleDistributions["RangerTruckBed"].items, "Base.Compass");
	table.insert(VehicleDistributions["RangerTruckBed"].items, 1);
	table.insert(VehicleDistributions["FishermanTruckBed"].items, "Base.Compass");
	table.insert(VehicleDistributions["FishermanTruckBed"].items, 1);
	
	
	
