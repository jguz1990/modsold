require 'Items/SuburbsDistributions'
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"
require "Items/ItemPicker"
if ProceduralDistributions.list.SafehouseTraps then 
	table.insert(ProceduralDistributions.list.SafehouseTraps.items, "Trap.BearTrapClosed")
	table.insert(ProceduralDistributions.list.SafehouseTraps.items, 5)
end


	
-- table.insert(SuburbsDistributions["gunstorestorage"]["all"].items, "Trap.BearTrapClosed");
-- table.insert(SuburbsDistributions["gunstorestorage"]["all"].items, 1.0);
	
-- table.insert(ProceduralDistributions.list["GunStoreShelf"].items, "Trap.BearTrapClosed");
-- table.insert(ProceduralDistributions.list["GunStoreShelf"].items, 1.0);

-- table.insert(SuburbsDistributions["hunting"]["locker"].items, "Trap.BearTrapClosed");
-- table.insert(SuburbsDistributions["hunting"]["locker"].items, 1.0);

-- table.insert(SuburbsDistributions["hunting"]["metal_shelves"].items, "Trap.BearTrapClosed");
-- table.insert(SuburbsDistributions["hunting"]["metal_shelves"].items, 1.0);

-- table.insert(SuburbsDistributions["hunting"]["metal_shelves"].items, "Trap.BearTrapClosed");
-- table.insert(SuburbsDistributions["hunting"]["metal_shelves"].items, 1.0);
	table.insert(ProceduralDistributions.list["CampingStoreGear"].items, "Trap.BearTrapClosed");
	table.insert(ProceduralDistributions.list["CampingStoreGear"].items, 1.0);

table.insert(SuburbsDistributions["Bag_WeaponBag"].items, "Trap.BearTrapClosed");
table.insert(SuburbsDistributions["Bag_WeaponBag"].items, 1.0);

table.insert(SuburbsDistributions["Bag_ALICEpack"].items, "Trap.BearTrapClosed");
table.insert(SuburbsDistributions["Bag_ALICEpack"].items, 1.0);

table.insert(ProceduralDistributions.list["MeleeWeapons"].items, "Trap.BearTrapClosed");
table.insert(ProceduralDistributions.list["MeleeWeapons"].items, 1.0);

table.insert(ProceduralDistributions.list["WardrobeRedneck"].items, "Trap.BearTrapClosed");
table.insert(ProceduralDistributions.list["WardrobeRedneck"].items, 1.0);

table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "Trap.BearTrapClosed");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 10);

table.insert(VehicleDistributions["HunterTruckBed"].items, "Trap.BearTrapClosed");
table.insert(VehicleDistributions["HunterTruckBed"].items, 1);

table.insert(VehicleDistributions["SurvivalistTruckBed"].items, "Trap.BearTrapClosed");
table.insert(VehicleDistributions["SurvivalistTruckBed"].items, 1);

	
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "Trap.BearTrapClosed");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 0.1);

table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "Trap.BearTrapClosed");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 0.1);