require "Items/Distributions"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"
--require "Items/ItemPicker"	


table.insert(SuburbsDistributions.Bag_SurvivorBag.items, "Boltcutters")
table.insert(SuburbsDistributions.Bag_SurvivorBag.items, 1)
	
table.insert(SuburbsDistributions.all.crate.items, "Boltcutters")
table.insert(SuburbsDistributions.all.crate.items, 0.4)	

-- table.insert(SuburbsDistributions.mechanic.metal_shelves.items, "Boltcutters")
-- table.insert(SuburbsDistributions.mechanic.metal_shelves.items, 0.25)	

table.insert(ProceduralDistributions.list.ArmyHangarTools.items, "Boltcutters")
table.insert(ProceduralDistributions.list.ArmyHangarTools.items, 1.5)	

table.insert(ProceduralDistributions.list.CabinetFactoryTools.items, "Boltcutters")
table.insert(ProceduralDistributions.list.CabinetFactoryTools.items, 1)	

table.insert(ProceduralDistributions.list.CrateTools.items, "Boltcutters")
table.insert(ProceduralDistributions.list.CrateTools.items, 0.4)		

table.insert(ProceduralDistributions.list.FireStorageTools.items, "Boltcutters")
table.insert(ProceduralDistributions.list.FireStorageTools.items, 1)


table.insert(ProceduralDistributions.list.GarageTools.items, "Boltcutters")
table.insert(ProceduralDistributions.list.GarageTools.items, 0.1)


table.insert(ProceduralDistributions.list.MetalShopTools.items, "Boltcutters")
table.insert(ProceduralDistributions.list.MetalShopTools.items, 1)	

table.insert(ProceduralDistributions.list.MechanicShelfTools.items, "Boltcutters")
table.insert(ProceduralDistributions.list.MechanicShelfTools.items, 1)
	
table.insert(ProceduralDistributions.list.PawnShopKnives.items, "Boltcutters")
table.insert(ProceduralDistributions.list.PawnShopKnives.items, 1)	
	
table.insert(ProceduralDistributions.list.ToolStoreTools.items, "Boltcutters")
table.insert(ProceduralDistributions.list.ToolStoreTools.items, 1)	

	
table.insert(ProceduralDistributions.list.MeleeWeapons.items, "Boltcutters")
table.insert(ProceduralDistributions.list.MeleeWeapons.items, 4)			


-- table.insert(SuburbsDistributions.armyhanger.counter.items, "Boltcutters")
-- table.insert(SuburbsDistributions.armyhanger.counter.items, 1.5)	

-- table.insert(SuburbsDistributions.armyhanger.locker.items, "Boltcutters")
-- table.insert(SuburbsDistributions.armyhanger.locker.items, 1.5)


table.insert(VehicleDistributions.ConstructionWorkerTruckBed.items, "Boltcutters")
table.insert(VehicleDistributions.ConstructionWorkerTruckBed.items, 1)
table.insert(VehicleDistributions.Fire.TruckBed.items, "Boltcutters")
table.insert(VehicleDistributions.Fire.TruckBed.items, 1)		
table.insert(VehicleDistributions.FossoilTruckBed.items, "Boltcutters")
table.insert(VehicleDistributions.FossoilTruckBed.items, 1)
table.insert(VehicleDistributions.MetalWelderTruckBed.items, "Boltcutters")
table.insert(VehicleDistributions.MetalWelderTruckBed.items, 1)				
table.insert(VehicleDistributions.SurvivalistTruckBed.items, "Boltcutters")
table.insert(VehicleDistributions.SurvivalistTruckBed.items, 1)	

if VehicleDistributions.Military then
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, "Boltcutters")
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, 1)	
end

if VehicleDistributions.blackoppsTrunk then
	table.insert(VehicleDistributions.blackoppsTrunk.items, "Boltcutters")
	table.insert(VehicleDistributions.blackoppsTrunk.items, 1)	
end