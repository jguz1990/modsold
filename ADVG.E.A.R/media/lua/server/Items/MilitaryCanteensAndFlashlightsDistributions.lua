require "Items/Distributions"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"
require "Items/ItemPicker"	
	
	table.insert(ProceduralDistributions.list["CampingStoreGear"].items, "Base.Canteen");
	table.insert(ProceduralDistributions.list["CampingStoreGear"].items, 1);	
	table.insert(ProceduralDistributions.list["CampingStoreGear"].items, "Base.Flashlight_Military");
	table.insert(ProceduralDistributions.list["CampingStoreGear"].items, 0.7);
	
	-- table.insert(SuburbsDistributions["camping"]["counter"].items, "Base.Canteen");
	-- table.insert(SuburbsDistributions["camping"]["counter"].items, 1);
	-- table.insert(SuburbsDistributions["camping"]["counter"].items, "Base.Canteen");
	-- table.insert(SuburbsDistributions["camping"]["counter"].items, 1);

	-- table.insert(SuburbsDistributions["gunstore"]["counter"].items, "Base.Flashlight_Military");
	-- table.insert(SuburbsDistributions["gunstore"]["counter"].items, 0.7);	
	-- table.insert(SuburbsDistributions["gunstore"]["counter"].items, "Base.Canteen");
	-- table.insert(SuburbsDistributions["gunstore"]["counter"].items, 1);

	-- table.insert(SuburbsDistributions["gunstore"]["displaycase"].items, "Base.Flashlight_Military");
	-- table.insert(SuburbsDistributions["gunstore"]["displaycase"].items, 0.7);	
	-- table.insert(SuburbsDistributions["gunstore"]["displaycase"].items, "Base.Canteen");
	-- table.insert(SuburbsDistributions["gunstore"]["displaycase"].items, 1);
	
	-- table.insert(SuburbsDistributions["gunstore"]["locker"].items, "Base.Flashlight_Military");
	-- table.insert(SuburbsDistributions["gunstore"]["locker"].items, 0.7);	
	-- table.insert(SuburbsDistributions["gunstore"]["locker"].items, "Base.Canteen");
	-- table.insert(SuburbsDistributions["gunstore"]["locker"].items, 1);
	
	-- table.insert(SuburbsDistributions["gunstore"]["metal_shelves"].items, "Base.Flashlight_Military");
	-- table.insert(SuburbsDistributions["gunstore"]["metal_shelves"].items, 0.7);	
	-- table.insert(SuburbsDistributions["gunstore"]["metal_shelves"].items, "Base.Canteen");
	-- table.insert(SuburbsDistributions["gunstore"]["metal_shelves"].items, 1);
	
	-- table.insert(SuburbsDistributions["gunstorestorage"]["all"].items, "Base.Flashlight_Military");
	-- table.insert(SuburbsDistributions["gunstorestorage"]["all"].items, 0.7);
	
	table.insert(ProceduralDistributions.list["GunStoreShelf"].items, "Base.Flashlight_Military");
	table.insert(ProceduralDistributions.list["GunStoreShelf"].items, 0.7);	
	table.insert(ProceduralDistributions.list["GunStoreShelf"].items, "Base.Canteen");
	table.insert(ProceduralDistributions.list["GunStoreShelf"].items, 1);	
	
	-- table.insert(SuburbsDistributions["armystorage"]["locker"].items, "Base.Flashlight_Military");
	-- table.insert(SuburbsDistributions["armystorage"]["locker"].items, 0.7);		
	-- table.insert(SuburbsDistributions["armystorage"]["locker"].items, "Base.Canteen");
	-- table.insert(SuburbsDistributions["armystorage"]["locker"].items, 1);
	
	-- table.insert(SuburbsDistributions["armystorage"]["metal_shelves"].items, "Base.Flashlight_Military");
	-- table.insert(SuburbsDistributions["armystorage"]["metal_shelves"].items, 0.7);	
	-- table.insert(SuburbsDistributions["armystorage"]["metal_shelves"].items, "Base.Canteen");
	-- table.insert(SuburbsDistributions["armystorage"]["metal_shelves"].items, 1);
	
	table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, "Base.Flashlight_Military");
	table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, 0.7);	
	table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, "Base.Canteen");
	table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, 1);
	
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, "Base.Flashlight_Military");
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, 0.1);	
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, "Base.Canteen");
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, 0.1);
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, "Base.Canteenfull");
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, 0.1);
	
	table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "Base.Flashlight_Military");
	table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 0.1);	
	table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "Base.Canteen");
	table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 0.1);
	table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "Base.Canteenfull");
	table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 0.1);
	
	table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "Base.Flashlight_Military");
	table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 0.1);	
	table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "Base.Canteen");
	table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 0.1);	
	table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "Base.Canteenfull");
	table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 0.1);
	
	table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "Base.Flashlight_Military");
	table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 0.1);	
	table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "Base.Canteen");
	table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 0.1);
	table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "Base.Canteenfull");
	table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 0.1);
		
	-- table.insert(SuburbsDistributions["all"]["crate"].items, "Base.Canteen");
	-- table.insert(SuburbsDistributions["all"]["crate"].items, 1);

	-- table.insert(SuburbsDistributions["all"]["metal_shelves"].items, "Base.Canteen");
	-- table.insert(SuburbsDistributions["all"]["metal_shelves"].items, 1);
	
	-- table.insert(SuburbsDistributions["generalstore"]["other"].items, "Base.Canteen");
	-- table.insert(SuburbsDistributions["generalstore"]["other"].items, 0.5);
	
	-- table.insert(SuburbsDistributions["storageunit"]["all"].items, "Base.Canteen");
	-- table.insert(SuburbsDistributions["storageunit"]["all"].items, 1);
	
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, "Base.Flashlight_Military");
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, 0.7);	
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, "Base.Canteen");
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, 1);
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, "Base.Canteenfull");
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items, 1);
	

	table.insert(SuburbsDistributions["Bag_ALICEpack_Army"].items, "Base.Flashlight_Military");
	table.insert(SuburbsDistributions["Bag_ALICEpack_Army"].items, 35);	
	table.insert(SuburbsDistributions["Bag_ALICEpack_Army"].items, "Base.Canteen");
	table.insert(SuburbsDistributions["Bag_ALICEpack_Army"].items, 50);
	table.insert(SuburbsDistributions["Bag_ALICEpack_Army"].items, "Base.Canteenfull");
	table.insert(SuburbsDistributions["Bag_ALICEpack_Army"].items, 50);


	table.insert(SuburbsDistributions["Bag_ALICEpack"].items, "Base.Flashlight_Military");
	table.insert(SuburbsDistributions["Bag_ALICEpack"].items, 35);	
	table.insert(SuburbsDistributions["Bag_ALICEpack"].items, "Base.Canteen");
	table.insert(SuburbsDistributions["Bag_ALICEpack"].items, 50);
	table.insert(SuburbsDistributions["Bag_ALICEpack"].items, "Base.Canteenfull");
	table.insert(SuburbsDistributions["Bag_ALICEpack"].items, 50);

	table.insert(VehicleDistributions["GloveBox"].items, "Base.Flashlight_Military");
	table.insert(VehicleDistributions["GloveBox"].items, 0.01);	
	
	table.insert(VehicleDistributions["SurvivalistTruckBed"].items, "Base.Flashlight_Military");
	table.insert(VehicleDistributions["SurvivalistTruckBed"].items, 1);
	table.insert(VehicleDistributions["SurvivalistTruckBed"].items, "Base.Canteenfull");
	table.insert(VehicleDistributions["SurvivalistTruckBed"].items, 1);
	table.insert(VehicleDistributions["SurvivalistTruckBed"].items, "Base.Canteen");
	table.insert(VehicleDistributions["SurvivalistTruckBed"].items, 1);
	
