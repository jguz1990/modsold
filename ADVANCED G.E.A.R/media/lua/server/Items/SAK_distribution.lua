require "Items/Distributions"
require "Items/ItemPicker"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"

	table.insert(SuburbsDistributions.all.inventorymale.items, "Base.SAK")
	table.insert(SuburbsDistributions.all.inventorymale.items, 0.05)

	table.insert(SuburbsDistributions.all.inventoryfemale.items, "Base.SAK")
	table.insert(SuburbsDistributions.all.inventoryfemale.items, 0.05)

	-- table.insert(SuburbsDistributions.all.crate.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.all.crate.items, 0.5)

	-- table.insert(SuburbsDistributions.all.counter.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.all.counter.items, 0.33)

	table.insert(ProceduralDistributions.list.DeskGeneric.items, "Base.SAK")
	table.insert(ProceduralDistributions.list.DeskGeneric.items, 0.1)
	
	table.insert(SuburbsDistributions.all.metal_shelves.items, "Base.SAK")
	table.insert(SuburbsDistributions.all.metal_shelves.items, 0.1)

	
if SuburbsDistributions.all.officedrawers.items then
	table.insert(SuburbsDistributions.all.officedrawers.items, "Base.SAK")
	table.insert(SuburbsDistributions.all.officedrawers.items, 1)
end

if ProceduralDistributions.list.OfficeDrawers then
	table.insert(ProceduralDistributions.list.OfficeDrawers.items, "Base.SAK")
	table.insert(ProceduralDistributions.list.OfficeDrawers.items, 1)
end
	
	
	table.insert(SuburbsDistributions.all.sidetable.items, "Base.SAK")
	table.insert(SuburbsDistributions.all.sidetable.items, 0.1)
	
	-- table.insert(SuburbsDistributions.armyhanger.counter.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.armyhanger.counter.items, 0.1)
	
	-- table.insert(SuburbsDistributions.armyhanger.locker.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.armyhanger.locker.items, 0.1)
	
	-- table.insert(SuburbsDistributions.armyhanger.metal_shelves.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.armyhanger.metal_shelves.items, 0.1)	
	
	-- table.insert(SuburbsDistributions.armystorage.locker.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.armystorage.locker.items, 0.1)
	
	-- table.insert(SuburbsDistributions.armystorage.metal_shelves.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.armystorage.metal_shelves.items, 0.1)	
	
	-- table.insert(SuburbsDistributions.armysurplus.metal_shelves.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.armysurplus.metal_shelves.items, 0.1)	
	
	-- table.insert(SuburbsDistributions.armysurplus.shelves.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.armysurplus.shelves.items, 0.1)		
	if ProceduralDistributions.list.ArmySurplusTools then	
		table.insert(ProceduralDistributions.list.ArmySurplusTools.items, "Base.SAK")
		table.insert(ProceduralDistributions.list.ArmySurplusTools.items, 0.1)	
	end
	
	table.insert(ProceduralDistributions.list.BedroomSideTable.items, "Base.SAK")
	table.insert(ProceduralDistributions.list.BedroomSideTable.items, 0.1)

	-- table.insert(SuburbsDistributions.camping.shelves.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.camping.shelves.items, 1)
	-- table.insert(SuburbsDistributions.camping.shelves.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.camping.shelves.items, 1)	
	
	table.insert(ProceduralDistributions.list.CampingStoreGear.items, "Base.SAK")
	table.insert(ProceduralDistributions.list.CampingStoreGear.items, 1)
	
	-- table.insert(SuburbsDistributions.changeroom.locker.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.changeroom.locker.items, 0.1)	

	-- table.insert(SuburbsDistributions.garagestorage.other.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.garagestorage.other.items, 1)
	
	-- table.insert(SuburbsDistributions.gunstore.counter.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.gunstore.counter.items, 0.08)
	
	-- table.insert(SuburbsDistributions.gunstore.locker.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.gunstore.locker.items, 0.08)
	
	-- table.insert(SuburbsDistributions.gunstore.metal_shelves.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.gunstore.metal_shelves.items, 0.08)
	
	-- table.insert(SuburbsDistributions.gunstorestorage.all.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.gunstorestorage.all.items, 0.1)	
	table.insert(ProceduralDistributions.list.GunStoreShelf.items, "Base.SAK")
	table.insert(ProceduralDistributions.list.GunStoreShelf.items, 0.1)	
	
	-- table.insert(SuburbsDistributions.hunting.locker.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.hunting.locker.items, 1)
	
	-- table.insert(SuburbsDistributions.hunting.metal_shelves.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.hunting.metal_shelves.items, 1)

	-- table.insert(SuburbsDistributions.policestorage.locker.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.policestorage.locker.items, 0.1)
	
	-- table.insert(SuburbsDistributions.policestorage.metal_shelves.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.policestorage.metal_shelves.items, 0.1)

	-- table.insert(SuburbsDistributions.security.locker.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.security.locker.items, 0.1)
	
	-- table.insert(SuburbsDistributions.shed.other.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.shed.other.items, 1)

	-- table.insert(SuburbsDistributions.storageunit.all.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.storageunit.all.items, 0.2)

	-- table.insert(SuburbsDistributions.toolstore.counter.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.toolstore.counter.items, 0.1)

	-- table.insert(SuburbsDistributions.toolstore.shelves.items, "Base.SAK")
	-- table.insert(SuburbsDistributions.toolstore.shelves.items, 0.1)	

	table.insert(ProceduralDistributions.list.ToolStoreAccessories.items, "Base.SAK")
	table.insert(ProceduralDistributions.list.ToolStoreAccessories.items, 0.1)

	table.insert(SuburbsDistributions.Bag_ALICEpack_Army.items, "Base.SAK")
	table.insert(SuburbsDistributions.Bag_ALICEpack_Army.items, 5)	

	table.insert(SuburbsDistributions.Bag_ALICEpack.items, "Base.SAK")
	table.insert(SuburbsDistributions.Bag_ALICEpack.items, 5)
	
	table.insert(SuburbsDistributions.Bag_SurvivorBag.items, "Base.SAK")
	table.insert(SuburbsDistributions.Bag_SurvivorBag.items, 10)
	
	table.insert(SuburbsDistributions.Bag_WeaponBag.items, "Base.SAK")
	table.insert(SuburbsDistributions.Bag_WeaponBag.items, 0.1)
	
	table.insert(SuburbsDistributions.SurvivorCache1.SurvivorCrate.items, "Base.SAK")
	table.insert(SuburbsDistributions.SurvivorCache1.SurvivorCrate.items, 1)
	
	table.insert(SuburbsDistributions.SurvivorCache2.SurvivorCrate.items, "Base.SAK")
	table.insert(SuburbsDistributions.SurvivorCache2.SurvivorCrate.items, 1)

	table.insert(ProceduralDistributions.list.KitchenRandom.items, "Base.SAK")
	table.insert(ProceduralDistributions.list.KitchenRandom.items, 0.67)
	
	table.insert(ProceduralDistributions.list.Locker.items, "Base.SAK")
	table.insert(ProceduralDistributions.list.Locker.items, 0.1)
	
	table.insert(ProceduralDistributions.list.LockerArmyBedroom.items, "Base.SAK")
	table.insert(ProceduralDistributions.list.LockerArmyBedroom.items, 1)	
	
	table.insert(ProceduralDistributions.list.WardrobeMan.items, "Base.SAK")
	table.insert(ProceduralDistributions.list.WardrobeMan.items, 0.1)	
	
	table.insert(ProceduralDistributions.list.WardrobeWoman.items, "Base.SAK")
	table.insert(ProceduralDistributions.list.WardrobeWoman.items, 0.1)	
		
	table.insert(ProceduralDistributions.list.WardrobeManClassy.items, "Base.SAK")
	table.insert(ProceduralDistributions.list.WardrobeManClassy.items, 0.1)

	table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, "Base.SAK")
	table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, 0.1)	
	
	table.insert(ProceduralDistributions.list.WardrobeRedneck.items, "Base.SAK")
	table.insert(ProceduralDistributions.list.WardrobeRedneck.items, 0.1)
	
	table.insert(ProceduralDistributions.list.FirearmWeapons.items, "Base.SAK")
	table.insert(ProceduralDistributions.list.FirearmWeapons.items, 0.1)
	
	table.insert(ProceduralDistributions.list.MeleeWeapons.items, "Base.SAK")
	table.insert(ProceduralDistributions.list.MeleeWeapons.items, 1)
	
	table.insert(VehicleDistributions.GloveBox.items, "Base.SAK")
	table.insert(VehicleDistributions.GloveBox.items, 0.1)	
	

	table.insert(VehicleDistributions.FishermanTruckBed.items, "SAK")
	table.insert(VehicleDistributions.FishermanTruckBed.items, 1)

