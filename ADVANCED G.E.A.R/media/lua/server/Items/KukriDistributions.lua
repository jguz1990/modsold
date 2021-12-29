require "Items/Distributions"
require "Items/ItemPicker"
require "Vehicles/VehicleDistributions"

	-- table.insert(SuburbsDistributions.shed.other.items, "Kukri")
	-- table.insert(SuburbsDistributions.shed.other.items, 0.08)
	--GunStoreShelf
	-- table.insert(SuburbsDistributions.gunstore.counter.items, "Kukri")
	-- table.insert(SuburbsDistributions.gunstore.counter.items, 0.1)	
	-- table.insert(SuburbsDistributions.gunstore.displaycase.items, "Kukri")
	-- table.insert(SuburbsDistributions.gunstore.displaycase.items, 0.1)	
	-- table.insert(SuburbsDistributions.gunstore.locker.items, "Kukri")
	-- table.insert(SuburbsDistributions.gunstore.locker.items, 0.1)	
	-- table.insert(SuburbsDistributions.gunstore.metal_shelves.items, "Kukri")
	-- table.insert(SuburbsDistributions.gunstore.metal_shelves.items, 0.1)	
	-- table.insert(SuburbsDistributions.gunstorestorage.all.items, "Kukri")
	-- table.insert(SuburbsDistributions.gunstorestorage.all.items, 0.1)	
	
	table.insert(ProceduralDistributions.list.GunStoreShelf.items, "Kukri")
	table.insert(ProceduralDistributions.list.GunStoreShelf.items, 0.1)
	
	table.insert(SuburbsDistributions.Bag_WeaponBag.items, "Kukri")
	table.insert(SuburbsDistributions.Bag_WeaponBag.items, 0.5)	
	table.insert(SuburbsDistributions.Bag_SurvivorBag.items, "Kukri")
	table.insert(SuburbsDistributions.Bag_SurvivorBag.items, 1)
	
	table.insert(SuburbsDistributions.SurvivorCache1.SurvivorCrate.items, "Kukri")
	table.insert(SuburbsDistributions.SurvivorCache1.SurvivorCrate.items, 0.1)	
	table.insert(SuburbsDistributions.SurvivorCache2.SurvivorCrate.items, "Kukri")
	table.insert(SuburbsDistributions.SurvivorCache2.SurvivorCrate.items, 0.1)	

	table.insert(ProceduralDistributions.list.MeleeWeapons.items, "Kukri")
	table.insert(ProceduralDistributions.list.MeleeWeapons.items, 1)
	
	-- table.insert(SuburbsDistributions.armysurplus.metal_shelves.items, "Kukri")
	-- table.insert(SuburbsDistributions.armysurplus.metal_shelves.items, 0.1)	
	-- table.insert(SuburbsDistributions.armysurplus.shelves.items, "Kukri")
	-- table.insert(SuburbsDistributions.armysurplus.shelves.items, 0.1)
	
	if ProceduralDistributions.list.ArmySurplusTools then	
		table.insert(ProceduralDistributions.list.ArmySurplusTools.items, "Kukri")
		table.insert(ProceduralDistributions.list.ArmySurplusTools.items, 1)	
	end
	
	table.insert(VehicleDistributions.SurvivalistTruckBed.items, "Kukri")
	table.insert(VehicleDistributions.SurvivalistTruckBed.items, 0.5)	
	table.insert(VehicleDistributions.HunterTruckBed.items, "Kukri")
	table.insert(VehicleDistributions.HunterTruckBed.items, 0.5)