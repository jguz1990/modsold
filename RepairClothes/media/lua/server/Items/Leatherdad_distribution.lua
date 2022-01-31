require "Items/Distributions"
require "Items/ItemPicker"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"

	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.Leatherdad");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.005);

	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.Leatherdad");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.005);

	-- table.insert(SuburbsDistributions["all"]["crate"].items, "Base.Leatherdad");
	-- table.insert(SuburbsDistributions["all"]["crate"].items, 0.05);

	-- table.insert(SuburbsDistributions["all"]["counter"].items, "Base.Leatherdad");
	-- table.insert(SuburbsDistributions["all"]["counter"].items, 0.033);
	
	-- table.insert(SuburbsDistributions["all"]["metal_shelves"].items, "Base.Leatherdad");
	-- table.insert(SuburbsDistributions["all"]["metal_shelves"].items, 0.01);
	
	-- table.insert(SuburbsDistributions["armyhanger"]["counter"].items, "Base.Leatherdad");
	-- table.insert(SuburbsDistributions["armyhanger"]["counter"].items, 0.01);
	
	-- table.insert(SuburbsDistributions["armyhanger"]["locker"].items, "Base.Leatherdad");
	-- table.insert(SuburbsDistributions["armyhanger"]["locker"].items, 0.01);
	
	-- table.insert(SuburbsDistributions["armystorage"]["locker"].items, "Base.Leatherdad");
	-- table.insert(SuburbsDistributions["armystorage"]["locker"].items, 0.01);
	
	-- table.insert(SuburbsDistributions["armysurplus"]["metal_shelves"].items, "Base.Leatherdad");
	-- table.insert(SuburbsDistributions["armysurplus"]["metal_shelves"].items, 0.1);	
	
	-- table.insert(SuburbsDistributions["armysurplus"]["shelves"].items, "Base.Leatherdad");
	-- table.insert(SuburbsDistributions["armysurplus"]["shelves"].items, 0.1);
		
	if ProceduralDistributions.list.ArmySurplusTools then	
		table.insert(ProceduralDistributions.list["ArmySurplusTools"].items, "Base.Leatherdad");
		table.insert(ProceduralDistributions.list["ArmySurplusTools"].items, 0.1);	
	end

	-- table.insert(SuburbsDistributions["camping"]["shelves"].items, "Base.Leatherdad");
	-- table.insert(SuburbsDistributions["camping"]["shelves"].items, 1);
	-- table.insert(SuburbsDistributions["camping"]["counter"].items, "Base.Leatherdad");
	-- table.insert(SuburbsDistributions["camping"]["counter"].items, 1);

	-- table.insert(SuburbsDistributions["garagestorage"]["other"].items, "Base.Leatherdad");
	-- table.insert(SuburbsDistributions["garagestorage"]["other"].items, 0.1);
	
	-- table.insert(SuburbsDistributions["gunstore"]["counter"].items, "Base.Leatherdad");
	-- table.insert(SuburbsDistributions["gunstore"]["counter"].items, 0.008);
	
	-- table.insert(SuburbsDistributions["gunstore"]["locker"].items, "Base.Leatherdad");
	-- table.insert(SuburbsDistributions["gunstore"]["locker"].items, 0.008);
	
	-- table.insert(SuburbsDistributions["gunstore"]["metal_shelves"].items, "Base.Leatherdad");
	-- table.insert(SuburbsDistributions["gunstore"]["metal_shelves"].items, 0.008);
	
	-- table.insert(SuburbsDistributions["gunstorestorage"]["all"].items, "Base.Leatherdad");
	-- table.insert(SuburbsDistributions["gunstorestorage"]["all"].items, 0.01);
	
	table.insert(ProceduralDistributions.list["GunStoreShelf"].items, "Base.Leatherdad");
	table.insert(ProceduralDistributions.list["GunStoreShelf"].items, 0.01);
	
	-- table.insert(SuburbsDistributions["hunting"]["locker"].items, "Base.Leatherdad");
	-- table.insert(SuburbsDistributions["hunting"]["locker"].items, 1);
	
	-- table.insert(SuburbsDistributions["hunting"]["metal_shelves"].items, "Base.Leatherdad");
	-- table.insert(SuburbsDistributions["hunting"]["metal_shelves"].items, 0.1);
	
	table.insert(ProceduralDistributions.list["CampingStoreGear"].items, "Base.Leatherdad");
	table.insert(ProceduralDistributions.list["CampingStoreGear"].items, 1);

	-- table.insert(SuburbsDistributions["policestorage"]["locker"].items, "Base.Leatherdad");
	-- table.insert(SuburbsDistributions["policestorage"]["locker"].items, 0.1);
	
	-- table.insert(SuburbsDistributions["policestorage"]["metal_shelves"].items, "Base.Leatherdad");
	-- table.insert(SuburbsDistributions["policestorage"]["metal_shelves"].items, 0.1);

	-- table.insert(SuburbsDistributions["security"]["locker"].items, "Base.Leatherdad");
	-- table.insert(SuburbsDistributions["security"]["locker"].items, 0.01);
	
	-- table.insert(SuburbsDistributions["shed"]["other"].items, "Base.Leatherdad");
	-- table.insert(SuburbsDistributions["shed"]["other"].items, 0.1);

	-- table.insert(SuburbsDistributions["storageunit"]["all"].items, "Base.Leatherdad");
	-- table.insert(SuburbsDistributions["storageunit"]["all"].items, 0.02);
--ToolStoreAccessories
	-- table.insert(SuburbsDistributions["toolstore"]["counter"].items, "Base.Leatherdad");
	-- table.insert(SuburbsDistributions["toolstore"]["counter"].items, 0.1);

	-- table.insert(SuburbsDistributions["toolstore"]["shelves"].items, "Base.Leatherdad");
	-- table.insert(SuburbsDistributions["toolstore"]["shelves"].items, 0.1);

	table.insert(ProceduralDistributions.list["ToolStoreAccessories"].items, "Base.Leatherdad");
	table.insert(ProceduralDistributions.list["ToolStoreAccessories"].items, 0.1);

	table.insert(SuburbsDistributions["Bag_ALICEpack_Army"].items, "Base.Leatherdad");
	table.insert(SuburbsDistributions["Bag_ALICEpack_Army"].items, 5);	

	table.insert(SuburbsDistributions["Bag_ALICEpack"].items, "Base.Leatherdad");
	table.insert(SuburbsDistributions["Bag_ALICEpack"].items, 5);
	
	table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "Base.Leatherdad");
	table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 10);
	
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, "Base.Leatherdad");
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, 1);
	
	table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "Base.Leatherdad");
	table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
	
	table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "Base.Leatherdad");
	table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
	
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, "Base.Leatherdad");
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, 1);
	
	table.insert(ProceduralDistributions.list["WardrobeRedneck"].items, "Base.Leatherdad");
	table.insert(ProceduralDistributions.list["WardrobeRedneck"].items, 0.01);
	
	table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Leatherdad");
	table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 0.1);
	
	table.insert(ProceduralDistributions.list["MeleeWeapons"].items, "Base.Leatherdad");
	table.insert(ProceduralDistributions.list["MeleeWeapons"].items, 1);
	
	table.insert(VehicleDistributions["GloveBox"].items, "Base.Leatherdad");
	table.insert(VehicleDistributions["GloveBox"].items, 0.01);	
		
	table.insert(VehicleDistributions["SurvivalistTruckBed"].items, "Leatherdad");
	table.insert(VehicleDistributions["SurvivalistTruckBed"].items, 0.5);	
	
	table.insert(VehicleDistributions["HunterTruckBed"].items, "Leatherdad");
	table.insert(VehicleDistributions["HunterTruckBed"].items, 0.5);
	
	table.insert(VehicleDistributions["Police"]["TruckBed"].items, "Leatherdad");
	table.insert(VehicleDistributions["Police"]["TruckBed"].items, 0.1);
		
	table.insert(VehicleDistributions["FishermanTruckBed"].items, "Leatherdad");
	table.insert(VehicleDistributions["FishermanTruckBed"].items, 1);	
	
	table.insert(VehicleDistributions["ElectricianTruckBed"].items, "Leatherdad");
	table.insert(VehicleDistributions["ElectricianTruckBed"].items, 1);

