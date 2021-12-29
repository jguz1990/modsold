require "Items/Distributions"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"

ISLiteratureUI.SetItemHidden("IntelFolder", true)

table.insert(ProceduralDistributions.list.LockerArmyBedroom.items, "IntelFolder")
table.insert(ProceduralDistributions.list.LockerArmyBedroom.items, 0.1)
table.insert(ProceduralDistributions.list.LockerArmyBedroom.items, "LabKeycard")
table.insert(ProceduralDistributions.list.LockerArmyBedroom.items, 0.01)

table.insert(ProceduralDistributions.list.MeleeWeapons.items, "IntelFolder")
table.insert(ProceduralDistributions.list.MeleeWeapons.items, 0.1)
table.insert(ProceduralDistributions.list.MeleeWeapons.items, "LabKeycard")
table.insert(ProceduralDistributions.list.MeleeWeapons.items, 0.1)

table.insert(SuburbsDistributions.Purse.items, "IntelFolder")
table.insert(SuburbsDistributions.Purse.items, 0.01)
table.insert(SuburbsDistributions.Purse.items, "LabKeycard")
table.insert(SuburbsDistributions.Purse.items, 0.001)
table.insert(SuburbsDistributions.Purse.items, "BlackwebDiskette")
table.insert(SuburbsDistributions.Purse.items, 0.001)

table.insert(SuburbsDistributions.Handbag.items, "IntelFolder")
table.insert(SuburbsDistributions.Handbag.items, 0.01)
table.insert(SuburbsDistributions.Handbag.items, "LabKeycard")
table.insert(SuburbsDistributions.Handbag.items, 0.001)
table.insert(SuburbsDistributions.Handbag.items, "BlackwebDiskette")
table.insert(SuburbsDistributions.Handbag.items, 0.001)

table.insert(SuburbsDistributions.Suitcase.items, "IntelFolder")
table.insert(SuburbsDistributions.Suitcase.items, 0.01)
table.insert(SuburbsDistributions.Suitcase.items, "LabKeycard")
table.insert(SuburbsDistributions.Suitcase.items, 0.001)
table.insert(SuburbsDistributions.Suitcase.items, "BlackwebDiskette")
table.insert(SuburbsDistributions.Suitcase.items, 0.001)

table.insert(SuburbsDistributions.Briefcase.items, "IntelFolder")
table.insert(SuburbsDistributions.Briefcase.items, 0.01)
table.insert(SuburbsDistributions.Briefcase.items, "LabKeycard")
table.insert(SuburbsDistributions.Briefcase.items, 0.001)
table.insert(SuburbsDistributions.Briefcase.items, "BlackwebDiskette")
table.insert(SuburbsDistributions.Briefcase.items, 0.001)

table.insert(SuburbsDistributions.Bag_MoneyBag.items, "IntelFolder")
table.insert(SuburbsDistributions.Bag_MoneyBag.items, 1)
table.insert(SuburbsDistributions.Bag_MoneyBag.items, "LabKeycard")
table.insert(SuburbsDistributions.Bag_MoneyBag.items, 0.1)
table.insert(SuburbsDistributions.Bag_MoneyBag.items, "IntelFolder")
table.insert(SuburbsDistributions.Bag_MoneyBag.items, 1)
table.insert(SuburbsDistributions.Bag_MoneyBag.items, "LabKeycard")
table.insert(SuburbsDistributions.Bag_MoneyBag.items, 0.1)
table.insert(SuburbsDistributions.Bag_MoneyBag.items, "BlackwebDiskette")
table.insert(SuburbsDistributions.Bag_MoneyBag.items, 1)

-- table.insert(SuburbsDistributions.motelroomoccupied.other.items, "IntelFolder")
-- table.insert(SuburbsDistributions.motelroomoccupied.other.items, 0.01)
-- table.insert(SuburbsDistributions.motelroomoccupied.other.items, "BlackwebDiskette")
-- table.insert(SuburbsDistributions.motelroomoccupied.other.items, 0.01)
-- table.insert(SuburbsDistributions.motelroomoccupied.other.items, "LabKeycard")
-- table.insert(SuburbsDistributions.motelroomoccupied.other.items, 0.001)

table.insert(ProceduralDistributions.list.WardrobeManClassy.items, "IntelFolder")
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, 0.01)
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, "LabKeycard")
table.insert(ProceduralDistributions.list.WardrobeManClassy.items, 0.001)
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, "IntelFolder")
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, 0.01)
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, "LabKeycard")
table.insert(ProceduralDistributions.list.WardrobeWomanClassy.items, 0.001)

-- table.insert(ProceduralDistributions.list.LockerClassy.junk, "IntelFolder")
-- table.insert(ProceduralDistributions.list.LockerClassy.junk, 0.01)
-- table.insert(ProceduralDistributions.list.LockerClassy.junk, "LabKeycard")
-- table.insert(ProceduralDistributions.list.LockerClassy.junk, 0.001)

-- table.insert(ProceduralDistributions.list.Locker.junk, "IntelFolder")
-- table.insert(ProceduralDistributions.list.Locker.junk, 0.001)
-- table.insert(ProceduralDistributions.list.Locker.junk, "LabKeycard")
-- table.insert(ProceduralDistributions.list.Locker.junk, 0.0001)
-- table.insert(ProceduralDistributions.list.Locker.junk, "BlackwebDiskette")
-- table.insert(ProceduralDistributions.list.Locker.junk, 0.0001)

-- table.insert(SuburbsDistributions.all.desk.junk, "IntelFolder")
-- table.insert(SuburbsDistributions.all.desk.junk, 0.01)
-- table.insert(SuburbsDistributions.all.desk.junk, "LabKeycard")
-- table.insert(SuburbsDistributions.all.desk.junk, 0.001)
-- table.insert(SuburbsDistributions.all.desk.junk, "BlackwebDiskette")
-- table.insert(SuburbsDistributions.all.desk.junk, 0.001)
if SuburbsDistributions.all.filingcabinet.junk then 
	table.insert(SuburbsDistributions.all.filingcabinet.junk, "IntelFolder")
	table.insert(SuburbsDistributions.all.filingcabinet.junk, 0.01)
	table.insert(SuburbsDistributions.all.filingcabinet.junk, "LabKeycard")
	table.insert(SuburbsDistributions.all.filingcabinet.junk, 0.001)
	table.insert(SuburbsDistributions.all.filingcabinet.junk, "BlackwebDiskette")
	table.insert(SuburbsDistributions.all.filingcabinet.junk, 0.001)
end

if ProceduralDistributions.list.FilingCabinetGeneric then
	table.insert(ProceduralDistributions.list.FilingCabinetGeneric.junk, "IntelFolder")
	table.insert(ProceduralDistributions.list.FilingCabinetGeneric.junk, 0.01)
	table.insert(ProceduralDistributions.list.FilingCabinetGeneric.junk, "LabKeycard")
	table.insert(ProceduralDistributions.list.FilingCabinetGeneric.junk, 0.001)
	table.insert(ProceduralDistributions.list.FilingCabinetGeneric.junk, "BlackwebDiskette")
	table.insert(ProceduralDistributions.list.FilingCabinetGeneric.junk, 0.001)
end

if SuburbsDistributions.all.officedrawers.items then
	table.insert(SuburbsDistributions.all.officedrawers.items, "IntelFolder")
	table.insert(SuburbsDistributions.all.officedrawers.items, 0.01)
end

if ProceduralDistributions.list.OfficeDrawers then
	table.insert(ProceduralDistributions.list.OfficeDrawers.items, "IntelFolder")
	table.insert(ProceduralDistributions.list.OfficeDrawers.items, 0.01)
end




table.insert(SuburbsDistributions.SurvivorCache1.SurvivorCrate.items, "IntelFolder")
table.insert(SuburbsDistributions.SurvivorCache1.SurvivorCrate.items, 0.1)
table.insert(SuburbsDistributions.SurvivorCache1.SurvivorCrate.items, "LabKeycard")
table.insert(SuburbsDistributions.SurvivorCache1.SurvivorCrate.items, 0.1)
table.insert(SuburbsDistributions.SurvivorCache1.SurvivorCrate.items, "BlackwebDiskette")
table.insert(SuburbsDistributions.SurvivorCache1.SurvivorCrate.items, 0.1)

table.insert(SuburbsDistributions.SurvivorCache2.SurvivorCrate.items, "IntelFolder")
table.insert(SuburbsDistributions.SurvivorCache2.SurvivorCrate.items, 0.1)
table.insert(SuburbsDistributions.SurvivorCache2.SurvivorCrate.items, "LabKeycard")
table.insert(SuburbsDistributions.SurvivorCache2.SurvivorCrate.items, 0.1)
table.insert(SuburbsDistributions.SurvivorCache2.SurvivorCrate.items, "BlackwebDiskette")
table.insert(SuburbsDistributions.SurvivorCache2.SurvivorCrate.items, 0.1)
	
-- table.insert(SuburbsDistributions.policestorage.locker.items, "IntelFolder")
-- table.insert(SuburbsDistributions.policestorage.locker.items, 0.1)	
-- table.insert(SuburbsDistributions.policestorage.locker.items, "LabKeycard")
-- table.insert(SuburbsDistributions.policestorage.locker.items, 0.01)		
-- table.insert(SuburbsDistributions.policestorage.locker.items, "BlackwebDiskette")
-- table.insert(SuburbsDistributions.policestorage.locker.items, 0.01)	

-- table.insert(SuburbsDistributions.security.locker.items, "IntelFolder")
-- table.insert(SuburbsDistributions.security.locker.items, 0.1)	
-- table.insert(SuburbsDistributions.security.locker.items, "LabKeycard")
-- table.insert(SuburbsDistributions.security.locker.items, 0.01)
	
-- table.insert(SuburbsDistributions.armystorage.locker.items, "IntelFolder")
-- table.insert(SuburbsDistributions.armystorage.locker.items, 0.1)	
-- table.insert(SuburbsDistributions.armystorage.locker.items, "LabKeycard")
-- table.insert(SuburbsDistributions.armystorage.locker.items, 0.01)

table.insert(SuburbsDistributions.Bag_WeaponBag.items, "IntelFolder")
table.insert(SuburbsDistributions.Bag_WeaponBag.items, 0.1)	
table.insert(SuburbsDistributions.Bag_WeaponBag.items, "LabKeycard")
table.insert(SuburbsDistributions.Bag_WeaponBag.items, 0.01)	
table.insert(SuburbsDistributions.Bag_WeaponBag.items, "BlackwebDiskette")
table.insert(SuburbsDistributions.Bag_WeaponBag.items, 0.01)	

table.insert(SuburbsDistributions.Bag_ALICEpack_Army.items, "IntelFolder")
table.insert(SuburbsDistributions.Bag_ALICEpack_Army.items, 0.1)
table.insert(SuburbsDistributions.Bag_ALICEpack_Army.items, "LabKeycard")
table.insert(SuburbsDistributions.Bag_ALICEpack_Army.items, 0.01)

table.insert(SuburbsDistributions.Bag_ALICEpack.items, "IntelFolder")
table.insert(SuburbsDistributions.Bag_ALICEpack.items, 0.1)
table.insert(SuburbsDistributions.Bag_ALICEpack.items, "LabKeycard")
table.insert(SuburbsDistributions.Bag_ALICEpack.items, 0.1)	
table.insert(SuburbsDistributions.Bag_ALICEpack.items, "BlackwebDiskette")
table.insert(SuburbsDistributions.Bag_ALICEpack.items, 0.1)	
	
table.insert(SuburbsDistributions.Bag_SurvivorBag.items, "IntelFolder")
table.insert(SuburbsDistributions.Bag_SurvivorBag.items, 0.1)	
table.insert(SuburbsDistributions.Bag_SurvivorBag.items, "LabKeycard")
table.insert(SuburbsDistributions.Bag_SurvivorBag.items, 0.1)
table.insert(SuburbsDistributions.Bag_SurvivorBag.items, "BlackwebDiskette")
table.insert(SuburbsDistributions.Bag_SurvivorBag.items, 0.1)

table.insert(ProceduralDistributions.list.FirearmWeapons.items, "IntelFolder")
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 0.1)
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "LabKeycard")
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 0.1)
table.insert(ProceduralDistributions.list.FirearmWeapons.items, "BlackwebDiskette")
table.insert(ProceduralDistributions.list.FirearmWeapons.items, 0.1)


table.insert(VehicleDistributions.GloveBox.junk, "IntelFolder")
table.insert(VehicleDistributions.GloveBox.junk, 0.01)	
table.insert(VehicleDistributions.GloveBox.junk, "LabKeycard")
table.insert(VehicleDistributions.GloveBox.junk, 0.001)	
table.insert(VehicleDistributions.GloveBox.junk, "BlackwebDiskette")
table.insert(VehicleDistributions.GloveBox.junk, 0.001)	

table.insert(VehicleDistributions.SurvivalistTruckBed.items, "IntelFolder")
table.insert(VehicleDistributions.SurvivalistTruckBed.items, 1)
table.insert(VehicleDistributions.SurvivalistTruckBed.items, "LabKeycard")
table.insert(VehicleDistributions.SurvivalistTruckBed.items, 1)
table.insert(VehicleDistributions.SurvivalistTruckBed.items, "BlackwebDiskette")
table.insert(VehicleDistributions.SurvivalistTruckBed.items, 1)
	
table.insert(VehicleDistributions.Radio.TruckBed.items, "IntelFolder")
table.insert(VehicleDistributions.Radio.TruckBed.items, 5)		
table.insert(VehicleDistributions.Radio.TruckBed.items, "BlackwebDiskette")
table.insert(VehicleDistributions.Radio.TruckBed.items, 0.1)	