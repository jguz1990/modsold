require "Items/Distributions"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"
		
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "WaterPurificationTablets");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1);	
table.insert(SuburbsDistributions["Bag_NormalHikingBag"].items, "WaterPurificationTablets");
table.insert(SuburbsDistributions["Bag_NormalHikingBag"].items, 0.5);	
table.insert(SuburbsDistributions["Bag_BigHikingBag"].items, "WaterPurificationTablets");
table.insert(SuburbsDistributions["Bag_BigHikingBag"].items, 0.5);	

-- table.insert(SuburbsDistributions["armysurplus"]["shelves"].items, "WaterPurificationTablets");
-- table.insert(SuburbsDistributions["armysurplus"]["shelves"].items, 0.5);

table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "WaterPurificationTablets");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 0.5);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "WaterPurificationTablets");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 0.5);

table.insert(ProceduralDistributions.list["CampingStoreGear"].items, "WaterPurificationTablets");
table.insert(ProceduralDistributions.list["CampingStoreGear"].items, 1);
table.insert(ProceduralDistributions.list["WardrobeRedneck"].items, "WaterPurificationTablets");
table.insert(ProceduralDistributions.list["WardrobeRedneck"].items, 0.1);	
		
table.insert(VehicleDistributions["SurvivalistTruckBed"].items, "WaterPurificationTablets");
table.insert(VehicleDistributions["SurvivalistTruckBed"].items, 1);	

table.insert(SuburbsDistributions["Bag_ALICEpack_Army"].items, "WaterPurificationTablets");
table.insert(SuburbsDistributions["Bag_ALICEpack_Army"].items, 0.1);

if VehicleDistributions.Military then
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "WaterPurificationTablets");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 5);	
end


if VehicleDistributions.blackoppsTrunk then
	table.insert(VehicleDistributions["blackoppsTrunk"].items, "WaterPurificationTablets");
	table.insert(VehicleDistributions["blackoppsTrunk"].items, 5);
end