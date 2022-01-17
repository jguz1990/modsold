require 'Items/SuburbsDistributions'
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"
if ProceduralDistributions.list.ArmySurplusMisc then
	table.insert(ProceduralDistributions.list.ArmySurplusMisc.items, "Movables.camo_netting_0")
	table.insert(ProceduralDistributions.list.ArmySurplusMisc.items, 5)
end


table.insert(ProceduralDistributions.list.LockerArmyBedroom.items, "Movables.camo_netting_0")
table.insert(ProceduralDistributions.list.LockerArmyBedroom.items, 0.1)

table.insert(ProceduralDistributions.list.WardrobeRedneck.items, "metal_shelves")
table.insert(ProceduralDistributions.list.WardrobeRedneck.items, 0.1)


table.insert(SuburbsDistributions.SurvivorCache1.SurvivorCrate.items, "Movables.camo_netting_0")
table.insert(SuburbsDistributions.SurvivorCache1.SurvivorCrate.items, 1)

table.insert(SuburbsDistributions.SurvivorCache2.SurvivorCrate.items, "Movables.camo_netting_0")
table.insert(SuburbsDistributions.SurvivorCache2.SurvivorCrate.items, 1)

table.insert(SuburbsDistributions.Bag_ALICEpack_Army.items, "Movables.camo_netting_0")
table.insert(SuburbsDistributions.Bag_ALICEpack_Army.items, 1)
	
table.insert(SuburbsDistributions.Bag_SurvivorBag.items, "Movables.camo_netting_0")
table.insert(SuburbsDistributions.Bag_SurvivorBag.items, 1)	

table.insert(VehicleDistributions.SurvivalistTruckBed.items, "Movables.camo_netting_0")
table.insert(VehicleDistributions.SurvivalistTruckBed.items, 5)

if VehicleDistributions.Military then
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, "Movables.camo_netting_0")
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, 5)	
end


if VehicleDistributions.blackoppsTrunk then
	table.insert(VehicleDistributions.blackoppsTrunk.items, "Movables.camo_netting_0")
	table.insert(VehicleDistributions.blackoppsTrunk.items, 1)
end


	
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, "Movables.camo_netting_0")
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, 1)
	
-- table.insert(SuburbsDistributions.armystorage.metal_shelves.items, "Movables.camo_netting_0")
-- table.insert(SuburbsDistributions.armystorage.metal_shelves.items, 1)
	
table.insert(ProceduralDistributions.list.CampingStoreGear.items, "Movables.camo_netting_0")
table.insert(ProceduralDistributions.list.CampingStoreGear.items, 1)
	
-- table.insert(SuburbsDistributions.armysurplus.metal_shelves.items, "Movables.camo_netting_0")
-- table.insert(SuburbsDistributions.armysurplus.metal_shelves.items, 1)	