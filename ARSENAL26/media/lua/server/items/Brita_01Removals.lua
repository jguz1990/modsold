require "Items/ItemPicker"
require "Items/SuburbsDistributions"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"


	-- param1: a distribution root or subcontainer, Distributions[1] should always contain the entire basegame distribution set without mods.
	-- param2: Name of the item as it appears in the distributions list (fullname)
	-- param3: Optionally a chance number can be defined to remove only matching items with that chance, or set to nil to remove all matching items regardless of chance.
	-- param4: Do recursive or not, if true it will recursivly remove items from all subcontainers.
	-----------------------------------------------------
	---------------------- PRIMARY ----------------------
	-----------------------------------------------------
	RemoveItemFromDistribution(Distributions[1], "Pistol",			nil, true);
	RemoveItemFromDistribution(Distributions[1], "Pistol2",			nil, true);
	RemoveItemFromDistribution(Distributions[1], "Pistol3",			nil, true);
	RemoveItemFromDistribution(Distributions[1], "Revolver_Short",		nil, true);
	RemoveItemFromDistribution(Distributions[1], "Revolver",		nil, true);
	RemoveItemFromDistribution(Distributions[1], "Revolver_Long",		nil, true);
	RemoveItemFromDistribution(Distributions[1], "VarmintRifle",		nil, true);
	RemoveItemFromDistribution(Distributions[1], "HuntingRifle",		nil, true);
	RemoveItemFromDistribution(Distributions[1], "AssaultRifle",		nil, true);
	RemoveItemFromDistribution(Distributions[1], "AssaultRifle2",		nil, true);
	RemoveItemFromDistribution(Distributions[1], "Shotgun",			nil, true);
	RemoveItemFromDistribution(Distributions[1], "DoubleBarrelShotgun",	nil, true);
	RemoveItemFromDistribution(Distributions[1], "ChokeTubeImproved",	nil, true);
	RemoveItemFromDistribution(Distributions[1], "ChokeTubeFull",		nil, true);
	RemoveItemFromDistribution(Distributions[1], "Bayonet",			nil, true);
	RemoveItemFromDistribution(Distributions[1], "RedDot",			nil, true);
	RemoveItemFromDistribution(Distributions[1], "GunLight",		nil, true);
	RemoveItemFromDistribution(Distributions[1], "Laser",			nil, true);
	RemoveItemFromDistribution(Distributions[1], "RecoilPad",		nil, true);
	RemoveItemFromDistribution(Distributions[1], "Sling", 			nil, true);
	RemoveItemFromDistribution(Distributions[1], "FiberglassStock",		nil, true);
	RemoveItemFromDistribution(Distributions[1], "AmmoStraps", 		nil, true);
	RemoveItemFromDistribution(Distributions[1], "IronSight",	 	nil, true);
	RemoveItemFromDistribution(Distributions[1], "x2Scope",			nil, true);
	RemoveItemFromDistribution(Distributions[1], "x4Scope",			nil, true);
	RemoveItemFromDistribution(Distributions[1], "x8Scope",			nil, true);

	RemoveItemFromDistribution(Distributions[1], "9mmClip",			nil, true);
	RemoveItemFromDistribution(Distributions[1], "45Clip",			nil, true);
	RemoveItemFromDistribution(Distributions[1], "44Clip",			nil, true);
	RemoveItemFromDistribution(Distributions[1], "223Clip",			nil, true);
	RemoveItemFromDistribution(Distributions[1], "556Clip",			nil, true);
	RemoveItemFromDistribution(Distributions[1], "308Clip",			nil, true);
	RemoveItemFromDistribution(Distributions[1], "M14Clip",			nil, true);
	RemoveItemFromDistribution(Distributions[1], "PistolCase1",		nil, true);
	RemoveItemFromDistribution(Distributions[1], "PistolCase2",		nil, true);
	RemoveItemFromDistribution(Distributions[1], "PistolCase3",		nil, true);

	RemoveItemFromDistribution(Distributions[1], "Katana",			nil, true);


	-----------------------------------------------------
	---------------------- SUBURBS ----------------------
	-----------------------------------------------------
	RemoveItemFromDistribution(SuburbsDistributions, "Pistol",		nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "Pistol2",		nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "Pistol3",		nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "Revolver_Short",	nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "Revolver",		nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "Revolver_Long",	nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "VarmintRifle",	nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "HuntingRifle",	nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "AssaultRifle",	nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "AssaultRifle2",	nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "ChokeTubeImproved",	nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "ChokeTubeFull",	nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "Bayonet",		nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "RedDot",		nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "GunLight",		nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "Laser",		nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "RecoilPad",		nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "Sling", 		nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "FiberglassStock", 	nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "AmmoStraps", 		nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "IronSight", 		nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "x2Scope",		nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "x4Scope",		nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "x8Scope",		nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "PistolCase1",		nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "PistolCase2",		nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "PistolCase3",		nil, true);


	-----------------------------------------------------
	---------------------- VEHICLE ----------------------
	-----------------------------------------------------
	RemoveItemFromDistribution(VehicleDistributions, "Pistol",		nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "Pistol2",		nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "Pistol3",		nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "Revolver",		nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "Revolver_Short",	nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "Revolver_Long",	nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "VarmintRifle",	nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "HuntingRifle",	nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "AssaultRifle",	nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "AssaultRifle2",	nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "DoubleBarrelShotgun",	nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "Shotgun",		nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "ChokeTubeImproved",	nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "ChokeTubeFull",	nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "Bayonet",		nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "RedDot",		nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "GunLight",		nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "Laser",		nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "RecoilPad",		nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "Sling", 		nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "FiberglassStock", 	nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "AmmoStraps",		nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "IronSight",		nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "x2Scope",		nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "x4Scope",		nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "x8Scope",		nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "PistolCase1",		nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "PistolCase2",		nil, true);
	RemoveItemFromDistribution(VehicleDistributions, "PistolCase3",		nil, true);

	RemoveItemFromDistribution(VehicleDistributions.Police, "HolsterSimple",	nil, true);
	RemoveItemFromDistribution(VehicleDistributions.Police, "HolsterDouble",	nil, true);
	RemoveItemFromDistribution(VehicleDistributions.Police, "Bag_NormalHikingBag",	nil, true);
--	RemoveItemFromDistribution(VehicleDistributions.Police, "Radio.HamRadio1",	nil, true);
--	RemoveItemFromDistribution(VehicleDistributions.Police, "Radio.HamRadio2",	nil, true);
	RemoveItemFromDistribution(VehicleDistributions.Police, "GunPowder",		nil, true);
--	RemoveItemFromDistribution(VehicleDistributions.Police, "Nightstick",		nil, true);
	RemoveItemFromDistribution(VehicleDistributions.Police, "308Box",		nil, true);
	RemoveItemFromDistribution(VehicleDistributions.Police, "223Box",		nil, true);

	--------------------------------------------------------
	-------------------- ALL PROCEDURAL --------------------
	--------------------------------------------------------
	RemoveItemFromDistribution(ProceduralDistributions.list, "Pistol",		nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "Pistol2",		nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "Pistol3",		nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "Revolver",		nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "Revolver_Short",	nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "Revolver_Long",	nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "VarmintRifle",	nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "HuntingRifle",	nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "AssaultRifle",	nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "AssaultRifle2",	nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "Shotgun",		nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "DoubleBarrelShotgun",	nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "ChokeTubeImproved",	nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "ChokeTubeFull",	nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "Bayonet",		nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "RedDot",		nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "GunLight",		nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "Laser",		nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "RecoilPad",		nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "Sling", 		nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "FiberglassStock", 	nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "AmmoStraps",		nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "IronSight",		nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "x2Scope",		nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "x4Scope",		nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "x8Scope",		nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "PistolCase1",		nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "PistolCase2",		nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "PistolCase3",		nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "M14Clip",		nil, true);


	--------------------------------------------------------
	---------- ONLY PROCEDURAL FIREARMWEAPONS LIST ---------
	--------------------------------------------------------
	RemoveItemFromDistribution(ProceduralDistributions.list["FirearmWeapons"], "Bullets9mmBox", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["FirearmWeapons"], "Bullets38Box", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["FirearmWeapons"], "Bullets45Box", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["FirearmWeapons"], "Bullets44Box", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["FirearmWeapons"], "223Box", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["FirearmWeapons"], "556Box", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["FirearmWeapons"], "308Box", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["FirearmWeapons"], "ShotgunShellsBox", nil, true);

	RemoveItemFromDistribution(ProceduralDistributions.list["GunStoreShelf"], "223Clip", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["GunStoreShelf"], "556Clip", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["GunStoreShelf"], "308Clip", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["GunStoreShelf"], "M14Clip", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["GunStoreShelf"], "44Clip", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["GunStoreShelf"], "45Clip", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["GunStoreShelf"], "9mmClip", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["GunStoreShelf"], "HolsterSimple", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["GunStoreShelf"], "HolsterDouble", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["GunStoreShelf"], "AmmoStraps", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["GunStoreShelf"], "AmmoStrap_Bullets", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["GunStoreShelf"], "AmmoStrap_Shells", nil, true);

	RemoveItemFromDistribution(ProceduralDistributions.list["PoliceStorageGuns"], "223Clip", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["PoliceStorageGuns"], "556Clip", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["PoliceStorageGuns"], "308Clip", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["PoliceStorageGuns"], "M14Clip", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["PoliceStorageGuns"], "44Clip", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["PoliceStorageGuns"], "45Clip", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["PoliceStorageGuns"], "9mmClip", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["PoliceStorageGuns"], "Bullets9mmBox", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["PoliceStorageGuns"], "Bullets38Box", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["PoliceStorageGuns"], "Bullets45Box", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["PoliceStorageGuns"], "Bullets44Box", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["PoliceStorageGuns"], "223Box", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["PoliceStorageGuns"], "556Box", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["PoliceStorageGuns"], "308Box", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["PoliceStorageGuns"], "ShotgunShellsBox", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["PoliceStorageGuns"], "HolsterSimple", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["PoliceStorageGuns"], "HolsterDouble", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["PoliceStorageGuns"], "AmmoStraps", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["PoliceStorageGuns"], "AmmoStrap_Bullets", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["PoliceStorageGuns"], "AmmoStrap_Shells", nil, true);

	RemoveItemFromDistribution(ProceduralDistributions.list["ArmyStorageGuns"], "223Clip", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["ArmyStorageGuns"], "556Clip", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["ArmyStorageGuns"], "308Clip", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["ArmyStorageGuns"], "M14Clip", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["ArmyStorageGuns"], "44Clip", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["ArmyStorageGuns"], "45Clip", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["ArmyStorageGuns"], "9mmClip", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["ArmyStorageGuns"], "Bullets9mmBox", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["ArmyStorageGuns"], "Bullets38Box", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["ArmyStorageGuns"], "Bullets45Box", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["ArmyStorageGuns"], "Bullets44Box", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["ArmyStorageGuns"], "223Box", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["ArmyStorageGuns"], "556Box", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["ArmyStorageGuns"], "308Box", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["ArmyStorageGuns"], "ShotgunShellsBox", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["ArmyStorageGuns"], "HolsterSimple", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["ArmyStorageGuns"], "HolsterDouble", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["ArmyStorageGuns"], "AmmoStraps", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["ArmyStorageGuns"], "AmmoStrap_Bullets", nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list["ArmyStorageGuns"], "AmmoStrap_Shells", nil, true);

	-- instead of passing the entire Distributions table you can also pass a sub element:
	-- RemoveItemFromDistribution(Distributions[1].conveniencestore, "Base.Hammer", nil, true);
	-- in the above example the hammer will only be removed from containers in the conveniencestore location.


	-- AMMO BOXES, RADIO, GUNPOWDER ITEMS ARE REMOVED BECAUSE VANILLA TABLE PROBABILITY IS TOO HIGH
	-- THEY ARE REINSERTED WITH OPTION CONFIGURABLE PROBABILITY VALUES


--[[	NO WORK ANYMORE ???
	--------------------------------------------------------
	--------------- ONLY GUN SPAWN LOCATIONS ---------------
	--------------------------------------------------------
	RemoveItemFromDistribution(Distributions[1].policestorage, "Bullets9mmBox", nil, true);
	RemoveItemFromDistribution(Distributions[1].policestorage, "Bullets38Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].policestorage, "Bullets45Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].policestorage, "Bullets44Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].policestorage, "223Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].policestorage, "556Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].policestorage, "308Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].policestorage, "ShotgunShellsBox", nil, true);
	RemoveItemFromDistribution(Distributions[1].policestorage, "Radio.WalkieTalkie4", nil, true);
	RemoveItemFromDistribution(Distributions[1].policestorage, "Radio.WalkieTalkie5", nil, true);
	RemoveItemFromDistribution(Distributions[1].policestorage, "Radio.HamRadio1", nil, true);
	RemoveItemFromDistribution(Distributions[1].policestorage, "Radio.HamRadio2", nil, true);
	RemoveItemFromDistribution(Distributions[1].policestorage, "GunPowder", nil, true);

	RemoveItemFromDistribution(Distributions[1].security, "Bullets9mmBox", nil, true);
	RemoveItemFromDistribution(Distributions[1].security, "Bullets38Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].security, "Bullets45Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].security, "Bullets44Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].security, "223Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].security, "556Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].security, "308Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].security, "ShotgunShellsBox", nil, true);
	RemoveItemFromDistribution(Distributions[1].security, "Radio.WalkieTalkie4", nil, true);
	RemoveItemFromDistribution(Distributions[1].security, "Radio.WalkieTalkie5", nil, true);
	RemoveItemFromDistribution(Distributions[1].security, "Radio.HamRadio1", nil, true);
	RemoveItemFromDistribution(Distributions[1].security, "Radio.HamRadio2", nil, true);
	RemoveItemFromDistribution(Distributions[1].security, "GunPowder", nil, true);

	RemoveItemFromDistribution(Distributions[1].armystorage, "Bullets9mmBox", nil, true);
	RemoveItemFromDistribution(Distributions[1].armystorage, "Bullets38Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].armystorage, "Bullets45Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].armystorage, "Bullets44Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].armystorage, "223Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].armystorage, "556Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].armystorage, "308Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].armystorage, "ShotgunShellsBox", nil, true);
	RemoveItemFromDistribution(Distributions[1].armystorage, "Radio.WalkieTalkie4", nil, true);
	RemoveItemFromDistribution(Distributions[1].armystorage, "Radio.WalkieTalkie5", nil, true);
	RemoveItemFromDistribution(Distributions[1].armystorage, "Radio.HamRadio1", nil, true);
	RemoveItemFromDistribution(Distributions[1].armystorage, "Radio.HamRadio2", nil, true);
	RemoveItemFromDistribution(Distributions[1].armystorage, "GunPowder", nil, true);

	RemoveItemFromDistribution(Distributions[1].gunstorestorage, "Bullets9mmBox", nil, true);
	RemoveItemFromDistribution(Distributions[1].gunstorestorage, "Bullets38Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].gunstorestorage, "Bullets45Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].gunstorestorage, "Bullets44Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].gunstorestorage, "223Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].gunstorestorage, "556Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].gunstorestorage, "308Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].gunstorestorage, "ShotgunShellsBox", nil, true);
	RemoveItemFromDistribution(Distributions[1].gunstorestorage, "Radio.WalkieTalkie4", nil, true);
	RemoveItemFromDistribution(Distributions[1].gunstorestorage, "Radio.WalkieTalkie5", nil, true);
	RemoveItemFromDistribution(Distributions[1].gunstorestorage, "Radio.HamRadio1", nil, true);
	RemoveItemFromDistribution(Distributions[1].gunstorestorage, "Radio.HamRadio2", nil, true);
	RemoveItemFromDistribution(Distributions[1].gunstorestorage, "GunPowder", nil, true);

	RemoveItemFromDistribution(Distributions[1].gunstore, "Bullets9mmBox", nil, true);
	RemoveItemFromDistribution(Distributions[1].gunstore, "Bullets38Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].gunstore, "Bullets45Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].gunstore, "Bullets44Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].gunstore, "223Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].gunstore, "556Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].gunstore, "308Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].gunstore, "ShotgunShellsBox", nil, true);
	RemoveItemFromDistribution(Distributions[1].gunstore, "Radio.WalkieTalkie4", nil, true);
	RemoveItemFromDistribution(Distributions[1].gunstore, "Radio.WalkieTalkie5", nil, true);
	RemoveItemFromDistribution(Distributions[1].gunstore, "Radio.HamRadio1", nil, true);
	RemoveItemFromDistribution(Distributions[1].gunstore, "Radio.HamRadio2", nil, true);
	RemoveItemFromDistribution(Distributions[1].gunstore, "GunPowder", nil, true);

	RemoveItemFromDistribution(Distributions[1].hunting, "Bullets9mmBox", nil, true);
	RemoveItemFromDistribution(Distributions[1].hunting, "Bullets38Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].hunting, "Bullets45Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].hunting, "Bullets44Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].hunting, "223Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].hunting, "556Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].hunting, "308Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].hunting, "ShotgunShellsBox", nil, true);
	RemoveItemFromDistribution(Distributions[1].hunting, "Radio.WalkieTalkie4", nil, true);
	RemoveItemFromDistribution(Distributions[1].hunting, "Radio.WalkieTalkie5", nil, true);
	RemoveItemFromDistribution(Distributions[1].hunting, "Radio.HamRadio1", nil, true);
	RemoveItemFromDistribution(Distributions[1].hunting, "Radio.HamRadio2", nil, true);
	RemoveItemFromDistribution(Distributions[1].hunting, "GunPowder", nil, true);

	RemoveItemFromDistribution(Distributions[1].armysurplus, "Bullets9mmBox", nil, true);
	RemoveItemFromDistribution(Distributions[1].armysurplus, "Bullets38Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].armysurplus, "Bullets45Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].armysurplus, "Bullets44Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].armysurplus, "223Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].armysurplus, "556Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].armysurplus, "308Box", nil, true);
	RemoveItemFromDistribution(Distributions[1].armysurplus, "ShotgunShellsBox", nil, true);
	RemoveItemFromDistribution(Distributions[1].armysurplus, "Radio.WalkieTalkie4", nil, true);
	RemoveItemFromDistribution(Distributions[1].armysurplus, "Radio.WalkieTalkie5", nil, true);
	RemoveItemFromDistribution(Distributions[1].armysurplus, "Radio.HamRadio1", nil, true);
	RemoveItemFromDistribution(Distributions[1].armysurplus, "Radio.HamRadio2", nil, true);
	RemoveItemFromDistribution(Distributions[1].armysurplus, "GunPowder", nil, true);
]]


--	WORKS TO CLEAR ALL
--	ClearAllDistributionItems(Distributions[1].policestorage, true)
--	ClearAllDistributionItems(Distributions[1].armystorage, true)
--	ClearAllDistributionItems(Distributions[1].gunstorestorage, true)
--	ClearAllDistributionItems(Distributions[1].gunstore, true)

--[[
if getActivatedMods():contains("DRK_1") then
	require "Vehicles/DRK_Armor_Distributions"

	print("RESETING DRK_1 USMC MOD DISTRO FROM REMOVALS")
	RemoveItemFromDistribution(ProceduralDistributions.list, "Base.Hat_PASGT_Helmet",	nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "Base.Hat_TPASGT_Helmet",	nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "Base.Interceptor_Armor",	nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "Base.Interceptor_Armor_v",	nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "Base.Interceptor_Armor_s",	nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "Base.Marpat_Jacket",		nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "Base.Marpat_Pants",		nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "Base.Interceptor_Pouches",	nil, true);
	RemoveItemFromDistribution(ProceduralDistributions.list, "Base.Hat_USMC_Cap",		nil, true);

	RemoveItemFromDistribution(SuburbsDistributions, "Base.Hat_PASGT_Helmet",	nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "Base.Hat_TPASGT_Helmet",	nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "Base.Interceptor_Armor",	nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "Base.Interceptor_Armor_v",	nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "Base.Interceptor_Armor_s",	nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "Base.Marpat_Jacket",		nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "Base.Marpat_Pants",		nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "Base.Interceptor_Pouches",	nil, true);
	RemoveItemFromDistribution(SuburbsDistributions, "Base.Hat_USMC_Cap",		nil, true);

	RemoveItemFromDistribution(Distributions[1], "Base.Hat_PASGT_Helmet",		nil, true);
	RemoveItemFromDistribution(Distributions[1], "Base.Hat_TPASGT_Helmet",		nil, true);
	RemoveItemFromDistribution(Distributions[1], "Base.Interceptor_Armor",		nil, true);
	RemoveItemFromDistribution(Distributions[1], "Base.Interceptor_Armor_v",	nil, true);
	RemoveItemFromDistribution(Distributions[1], "Base.Interceptor_Armor_s",	nil, true);
	RemoveItemFromDistribution(Distributions[1], "Base.Marpat_Jacket",		nil, true);
	RemoveItemFromDistribution(Distributions[1], "Base.Marpat_Pants",		nil, true);
	RemoveItemFromDistribution(Distributions[1], "Base.Interceptor_Pouches",	nil, true);
	RemoveItemFromDistribution(Distributions[1], "Base.Hat_USMC_Cap",		nil, true);
end
]]
