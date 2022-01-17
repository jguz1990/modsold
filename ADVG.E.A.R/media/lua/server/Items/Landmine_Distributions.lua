require 'Items/SuburbsDistributions'
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"
require "Items/ItemPicker"
if ProceduralDistributions.list.SafehouseTraps then 
	table.insert(ProceduralDistributions.list.SafehouseTraps.items, "Explosives.LandMine")
	table.insert(ProceduralDistributions.list.SafehouseTraps.items, 0.6)
	table.insert(ProceduralDistributions.list.SafehouseTraps.items, "Explosives.LandMineBig")
	table.insert(ProceduralDistributions.list.SafehouseTraps.items, 0.3)
	table.insert(ProceduralDistributions.list.SafehouseTraps.items, "Explosives.LandMineBigBox")
	table.insert(ProceduralDistributions.list.SafehouseTraps.items, 0.1)
	table.insert(ProceduralDistributions.list.SafehouseTraps.items, "Explosives.LandMineBox")
	table.insert(ProceduralDistributions.list.SafehouseTraps.items, 0.4)
end


if ProceduralDistributions.list.ArmyStorageAmmunition then 
	table.insert(ProceduralDistributions.list.ArmyStorageAmmunition.items, "Explosives.LandMine")
	table.insert(ProceduralDistributions.list.ArmyStorageAmmunition.items, 6)	
	table.insert(ProceduralDistributions.list.ArmyStorageAmmunition.items, "Explosives.LandMineBig")
	table.insert(ProceduralDistributions.list.ArmyStorageAmmunition.items, 3)	
	table.insert(ProceduralDistributions.list.ArmyStorageAmmunition.items, "Explosives.LandMineBigBox")
	table.insert(ProceduralDistributions.list.ArmyStorageAmmunition.items, 1)	
	table.insert(ProceduralDistributions.list.ArmyStorageAmmunition.items, "Explosives.LandMineBox")
	table.insert(ProceduralDistributions.list.ArmyStorageAmmunition.items, 4)
end

-- table.insert(SuburbsDistributions.armystorage.locker.items, "Explosives.LandMine")
-- table.insert(SuburbsDistributions.armystorage.locker.items, 6)	
-- table.insert(SuburbsDistributions.armystorage.locker.items, "Explosives.LandMineBig")
-- table.insert(SuburbsDistributions.armystorage.locker.items, 3)	
-- table.insert(SuburbsDistributions.armystorage.locker.items, "Explosives.LandMineBigBox")
-- table.insert(SuburbsDistributions.armystorage.locker.items, 1)	
-- table.insert(SuburbsDistributions.armystorage.locker.items, "Explosives.LandMineBox")
-- table.insert(SuburbsDistributions.armystorage.locker.items, 4)

table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, "Explosives.LandMine")
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, 6)	
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, "Explosives.LandMineBig")
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, 3)	
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, "Explosives.LandMineBigBox")
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, 1)	
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, "Explosives.LandMineBox")
table.insert(ProceduralDistributions.list.ArmyStorageGuns.items, 4)

-- table.insert(SuburbsDistributions.gunstorestorage.all.items, "Explosives.LandMine")
-- table.insert(SuburbsDistributions.gunstorestorage.all.items, 1.0)	
-- table.insert(SuburbsDistributions.gunstorestorage.all.items, "Explosives.LandMineBox")
-- table.insert(SuburbsDistributions.gunstorestorage.all.items, 1.0)

table.insert(SuburbsDistributions.Bag_WeaponBag.items, "Explosives.LandMine")
table.insert(SuburbsDistributions.Bag_WeaponBag.items, 1.0)
table.insert(SuburbsDistributions.Bag_WeaponBag.items, "Explosives.LandMineBox")
table.insert(SuburbsDistributions.Bag_WeaponBag.items, 1.0)

table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Explosives.LandMine")
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 1.0)	
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Explosives.LandMineBox")
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 1.0)	

table.insert(SuburbsDistributions.Bag_ALICEpack_Army.items, "Explosives.LandMine")
table.insert(SuburbsDistributions.Bag_ALICEpack_Army.items, 6)	
table.insert(SuburbsDistributions.Bag_ALICEpack_Army.items, "Explosives.LandMineBox")
table.insert(SuburbsDistributions.Bag_ALICEpack_Army.items, 4)	

table.insert(SuburbsDistributions.Bag_ALICEpack.items, "Explosives.LandMine")
table.insert(SuburbsDistributions.Bag_ALICEpack.items, 1)	
table.insert(SuburbsDistributions.Bag_ALICEpack.items, "Explosives.LandMineBox")
table.insert(SuburbsDistributions.Bag_ALICEpack.items, 1)
	
table.insert(VehicleDistributions.SurvivalistTruckBed.items, "Explosives.LandMine")
table.insert(VehicleDistributions.SurvivalistTruckBed.items, 0.5)			
table.insert(VehicleDistributions.SurvivalistTruckBed.items, "Explosives.LandMineBox")
table.insert(VehicleDistributions.SurvivalistTruckBed.items, 0.1)	
		
table.insert(SuburbsDistributions.SurvivorCache1.SurvivorCrate.items, "Explosives.LandMine")
table.insert(SuburbsDistributions.SurvivorCache1.SurvivorCrate.items, 0.1)	
table.insert(SuburbsDistributions.SurvivorCache2.SurvivorCrate.items, "Explosives.LandMineBox")
table.insert(SuburbsDistributions.SurvivorCache2.SurvivorCrate.items, 0.1)
		
