require "Items/Distributions"
require "Items/ItemPicker"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"

	-- table.insert(SuburbsDistributions["armyhanger"]["counter"].items, "Base.P38DT");
	-- table.insert(SuburbsDistributions["armyhanger"]["counter"].items, 0.1);
	
	-- table.insert(SuburbsDistributions["armyhanger"]["locker"].items, "Base.P38DT");
	-- table.insert(SuburbsDistributions["armyhanger"]["locker"].items, 0.1);
	
	-- table.insert(SuburbsDistributions["armyhanger"]["metal_shelves"].items, "Base.P38DT");
	-- table.insert(SuburbsDistributions["armyhanger"]["metal_shelves"].items, 0.1);	
	
	-- table.insert(SuburbsDistributions["armystorage"]["locker"].items, "Base.P38DT");
	-- table.insert(SuburbsDistributions["armystorage"]["locker"].items, 1);
	
	-- table.insert(SuburbsDistributions["armystorage"]["metal_shelves"].items, "Base.P38DT");
	-- table.insert(SuburbsDistributions["armystorage"]["metal_shelves"].items, 0.1);	
	
	-- table.insert(SuburbsDistributions["armysurplus"]["metal_shelves"].items, "Base.P38DT");
	-- table.insert(SuburbsDistributions["armysurplus"]["metal_shelves"].items, 0.1);	
	
	-- table.insert(SuburbsDistributions["armysurplus"]["shelves"].items, "Base.P38DT");
	-- table.insert(SuburbsDistributions["armysurplus"]["shelves"].items, 0.1);
	
	

	-- table.insert(SuburbsDistributions["camping"]["shelves"].items, "Base.P38DT");
	-- table.insert(SuburbsDistributions["camping"]["shelves"].items, 0.1);
	-- table.insert(SuburbsDistributions["camping"]["counter"].items, "Base.P38DT");
	-- table.insert(SuburbsDistributions["camping"]["counter"].items, 0.1);
	
	
	table.insert(ProceduralDistributions.list["CampingStoreGear"].items, "Base.P38DT");
	table.insert(ProceduralDistributions.list["CampingStoreGear"].items, 0.1);
	
	-- table.insert(SuburbsDistributions["gunstore"]["counter"].items, "Base.P38DT");
	-- table.insert(SuburbsDistributions["gunstore"]["counter"].items, 0.08);
	
	-- table.insert(SuburbsDistributions["gunstore"]["locker"].items, "Base.P38DT");
	-- table.insert(SuburbsDistributions["gunstore"]["locker"].items, 0.08);
	
	-- table.insert(SuburbsDistributions["gunstore"]["metal_shelves"].items, "Base.P38DT");
	-- table.insert(SuburbsDistributions["gunstore"]["metal_shelves"].items, 0.08);
	
	-- table.insert(SuburbsDistributions["gunstorestorage"]["all"].items, "Base.P38DT");
	-- table.insert(SuburbsDistributions["gunstorestorage"]["all"].items, 0.1);
	
	-- table.insert(SuburbsDistributions["hunting"]["locker"].items, "Base.P38DT");
	-- table.insert(SuburbsDistributions["hunting"]["locker"].items, 0.1);
	
	-- table.insert(SuburbsDistributions["hunting"]["metal_shelves"].items, "Base.P38DT");
	-- table.insert(SuburbsDistributions["hunting"]["metal_shelves"].items, 0.1);

	table.insert(SuburbsDistributions["Bag_ALICEpack_Army"].items, "Base.P38DT");
	table.insert(SuburbsDistributions["Bag_ALICEpack_Army"].items, 10);	

	table.insert(SuburbsDistributions["Bag_ALICEpack"].items, "Base.P38DT");
	table.insert(SuburbsDistributions["Bag_ALICEpack"].items, 10);
	
	table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "Base.P38DT");
	table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 10);
	
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, "Base.P38DT");
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, 0.1);
	
	table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "Base.P38DT");
	table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1);
	
	table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "Base.P38DT");
	table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1);
	
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, "Base.P38DT");
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, 1);	
	
	table.insert(ProceduralDistributions.list["WardrobeRedneck"].items, "Base.P38DT");
	table.insert(ProceduralDistributions.list["WardrobeRedneck"].items, 0.01);
	
	table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.P38DT");
	table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 0.1);
	
	table.insert(ProceduralDistributions.list["MeleeWeapons"].items, "Base.P38DT");
	table.insert(ProceduralDistributions.list["MeleeWeapons"].items, 0.1);
	
	
	table.insert(VehicleDistributions["SurvivalistTruckBed"].items, "Base.P38DT");
	table.insert(VehicleDistributions["SurvivalistTruckBed"].items, 0.1);
	
if VehicleDistributions.Military then


	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "Base.P38DT");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 1);	
	table.insert(VehicleDistributions["MilitarySeat"].items, "Base.P38DT");
	table.insert(VehicleDistributions["MilitarySeat"].items, 3);	
	

end
